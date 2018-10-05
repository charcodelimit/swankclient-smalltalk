tests
testSecret
	| server secret |
	server := SwankServer host: 'localhost'.
	secret := server secret: FileSystem workingDirectory.
	self assert: secret equals: 'superSecret'.
	secret := server secret: 'foo'.
	self assert: secret isNil