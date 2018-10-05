running
setUpStream
	|stream|
	stream := SwankMockSocketStream openConnectionToHost: connection server hostname port: connection server inputPort.
		connection stream: stream.
		^stream