tests
testConnectionInfoCommand
	| connection promise resolved result |
	self class mutex
		critical: [ connection := SwankConnection openOnHostNamed: 'localhost' port: 4005.
			promise := connection send: SlimeConnectionInfoCommand new.
			(Delay forMilliseconds: 250) wait.
			self assert: connection isDispatching.
			connection close.
			resolved := promise waitTimeoutSeconds: 5.
			self assert: resolved.
			result := promise value.
			self assert: result isConsCell.
			self assert: (result detect: [ :e | e = #':pid' ] ifNone: [nil]) equals: #':pid' ]