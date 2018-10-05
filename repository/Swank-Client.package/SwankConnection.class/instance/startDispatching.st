private dispatch
startDispatching
	self isConnected
		ifTrue: [mutex
				critical: [internalConnectionState := #alive].
			listenProcess := [self dispatchEvents] fork]