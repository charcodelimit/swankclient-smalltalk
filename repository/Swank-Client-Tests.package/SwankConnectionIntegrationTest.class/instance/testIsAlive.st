tests
testIsAlive
	| connection |
	self class mutex
		critical: [connection := SwankConnection openOnHostNamed: 'localhost' port: 4005.
			self assert: connection isAlive.
			connection close]