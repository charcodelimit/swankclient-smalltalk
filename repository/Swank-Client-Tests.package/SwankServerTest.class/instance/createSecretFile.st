setup
createSecretFile
	(FileSystem workingDirectory resolveString: SwankServer slimeSecretFile)
		writeStreamDo: [ :stream | 
			stream nextPutAll: 'superSecret'.
			stream crlf.
			stream nextPutAll: 'junk ...' ]