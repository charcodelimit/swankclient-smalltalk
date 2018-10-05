processing
processValue: aValue state: aSwankConnectionState 
	| value id request |
	value := aValue car.
	id := aValue cadr.
	request := aSwankConnectionState popRequest: id.
	request
		ifNil: [self connection logger warn: 'Warn: No matching request found ' object: id]
		ifNotNil: [request value: value]