private connection
sendSecret
	| secret cmd message |
	server homeDirectory
		ifNotNil: [ secret := server secret: server homeDirectory.
			secret
				ifNotNil: [ cmd := SlimeSecret from: secret.
					message := cmd render: self state.
					self sendMessageString: message ] ]