private connection
ensureConnection
	self isConnected
		ifTrue: [ ^ self ].
	self openStream.
	self connect.
	self startDispatching