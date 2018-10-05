setup
deleteSecretFile
	(FileSystem workingDirectory
		resolveString:  SwankServer slimeSecretFile) delete