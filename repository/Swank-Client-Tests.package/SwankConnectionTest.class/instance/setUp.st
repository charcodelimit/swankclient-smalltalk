running
setUp
	| server |
	super setUp.
	server := SwankServer host: #[127 0 0 1] inputPort: 123.
	server homeDirectory: FileSystem workingDirectory.
	connection := SwankConnection new.
	connection initialize.
	connection server: server