tests
testSocketNetConnectNoSecret
	| stream |
	stream := self setUpStream.
	connection connect.
	self assert: stream socket hostAddress equals: #[127 0 0 1].
	self assert: stream socket port equals: 123.
	self assert: stream socket options notNil.
	self assert: (stream socket options at: 'SO_KEEPALIVE').
	self assert: stream outStream isEmpty