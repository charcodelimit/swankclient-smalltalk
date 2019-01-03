tests
testSocketNetConnectSecret
	| stream |
	SwankServerTest new
		withSecretFile: [ stream := self setUpStream.
			connection connect.
			self assert: stream socket hostAddress = #[127 0 0 1].
			self assert: stream socket port = 123.
			self assert: stream socket options notNil.
			self assert: (stream socket options at: 'SO_KEEPALIVE').
			self assert: stream getSentData = '00000bsuperSecret' ]