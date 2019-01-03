tests
testSocketPath
	| server |
	server := SwankServer host: 'localhost'.
	self assert: server socketPath isNil.
	server := SwankServer socketPath: '/tmp/swank-socket'.
	self assert: server socketPath equals: '/tmp/swank-socket'.
	self assert: server hostname isNil.
	self assert: server inputPort isNil.
	self assert: server outputPort isNil.