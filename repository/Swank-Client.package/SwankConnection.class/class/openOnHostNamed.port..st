instance creation
openOnHostNamed: hostName port: portNumber 
	| server hostIP |
	hostIP := NetNameResolver addressForName: hostName timeout: self resolveTimeout.
	server := SwankServer host: hostIP inputPort: portNumber.
	^ self openOnServer: server