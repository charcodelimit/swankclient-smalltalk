instance creation
host: aHostname inputPort: aPort
	^ self new
		hostname: aHostname;
		inputPort: aPort;
		socketPath: nil;
		homeDirectory: self unixHomeDirectory;
		yourself