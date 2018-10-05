utils
withSecretFile: aBlock
	self createSecretFile.
	aBlock ensure: [self deleteSecretFile].