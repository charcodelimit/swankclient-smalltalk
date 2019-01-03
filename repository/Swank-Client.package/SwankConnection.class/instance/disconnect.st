private connection
disconnect
	self logger debug: 'disconnecting'.
	mutex
		critical: [ internalConnectionState := #closing.
			self stream
				ifNotNil: [ self stream close.
					self stream: nil ].
			self stream ifNil: [ internalConnectionState := #dead ].
			self stopDispatching ]