private connection
ensureConnection
	self isConnected
		ifTrue: [^ self].
	self stream
		ifNotNil: [self stream close].
	self
		stream: (SocketStream openConnectionToHost: self server hostname port: self server inputPort).
	self connect.
	self startDispatching 