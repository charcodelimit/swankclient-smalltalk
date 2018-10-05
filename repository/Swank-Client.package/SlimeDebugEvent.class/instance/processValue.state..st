processing
processValue: aValue state: aSwankConnectionState 
	| value |
	value := aValue third.
	value
		ifNotNil: [self connection logger error: 'received debug event reason: ' object: value first]