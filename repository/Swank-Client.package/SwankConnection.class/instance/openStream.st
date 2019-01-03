private connection
openStream
	self stream ifNotNil: [ self stream close ].
	self server socketPath
		ifNil: [ self
				stream: (SocketStream openConnectionToHost: self server hostname port: self server inputPort) ]
		ifNotNil: [ | socket |
			socket := Socket newIPC
				connectTo: (NetNameResolver addressForSocketPath: self server socketPath).
			(Delay forMilliseconds: 10) wait.
			self stream: (SocketStream on: socket) ]