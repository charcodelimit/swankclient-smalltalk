instance creation
openConnectionToHost: hostIP port: portNumber
	|socket|
	socket:= SwankMockSocket new.
	socket connectTo: hostIP port: portNumber.
	^(self on: '') socket: socket; yourself