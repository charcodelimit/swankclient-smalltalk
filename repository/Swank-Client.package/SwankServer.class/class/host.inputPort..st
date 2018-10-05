instance creation
host: aHostname inputPort: aPort 
	^ self new hostname: aHostname;
		 inputPort: aPort;
		homeDirectory: self unixHomeDirectory;
		 yourself