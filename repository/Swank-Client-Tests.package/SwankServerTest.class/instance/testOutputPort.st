tests
testOutputPort
	| server |
	server := SwankServer host: 'localhost'.
	self assert: server outputPort isNil.
	server outputPort: 123.
	self assert: server outputPort = 123