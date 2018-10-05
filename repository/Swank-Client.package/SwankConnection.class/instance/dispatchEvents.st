private dispatch
dispatchEvents
	| data currentState dispatching |
	dispatching := true.
	[dispatching]
		whileTrue: [listening := true.
			10 milliSeconds asDelay wait.
			mutex
				critical: [(self isConnected
							and: [stream isDataAvailable])
						ifTrue: [data := self receiveData]].
			mutex
				critical: [stream isOtherEndConnected
						ifFalse: [self disconnect]].
			(data isNil
					or: [data isEmpty])
				ifFalse: [self dispatchEvent: data.
					data := nil].
			mutex
				critical: [currentState := internalConnectionState].
			currentState = #closing
				ifTrue: [self disconnect].
			dispatching := currentState = #alive].
	listening := false