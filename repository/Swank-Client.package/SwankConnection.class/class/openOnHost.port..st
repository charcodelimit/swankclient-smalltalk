instance creation
openOnHost: hostAddress port: portNumber 
	| server |
	server := SwankServer host: hostAddress inputPort: portNumber.
	^ self openOnServer: server