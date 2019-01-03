tests
testIpcSocketConnection
	| connection promise resolved |
	self class mutex
		critical: [ connection := SwankConnection openOnSocketPath: '/tmp/swank-server'.
			promise := connection send: (SlimeLispFunctionCommand function: #+ arguments: {2 . 3}).
			resolved := promise waitTimeoutSeconds: 5.
			self assert: connection isDispatching.
			self assert: resolved.
			self assert: promise value equals: 5.
			connection close ]