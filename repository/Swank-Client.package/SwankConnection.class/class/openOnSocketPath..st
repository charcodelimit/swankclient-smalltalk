instance creation
openOnSocketPath: aSocketPath
	| server |
	server := SwankServer socketPath: aSocketPath.
	^ self openOnServer: server