private connection
disconnect
	self logger debug: 'disconnecting'.
	mutex
		critical: [self stream
				ifNotNil: [self stream close.
					self stream: nil].
			self stream
				ifNil: [internalConnectionState := #dead].
			listenProcess
				ifNotNil: [| process |
					process := listenProcess.
					listenProcess := nil.
					listening := false.
					process terminate]]