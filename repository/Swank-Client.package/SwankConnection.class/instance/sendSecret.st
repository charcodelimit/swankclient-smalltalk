private connection
sendSecret
	| secret |
	server homeDirectory
		ifNotNil: [secret := server secret: server homeDirectory.
			secret
				ifNotNil: [self send: (SlimeSecret from: secret)]]