tests
testConnecionInfoCommand
	| connection |
	self class mutex
		critical: [connection := SwankConnection openOnHostNamed: 'localhost' port: 4005.
			connection send: SlimeConnectionInfoCommand new.
			(Delay forMilliseconds: 250) wait.
			self assert: connection isListening.
			connection close]