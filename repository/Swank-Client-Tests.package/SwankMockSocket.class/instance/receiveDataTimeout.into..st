socket protocol
receiveDataTimeout: timeoutSeconds into: aBuffer 
	aBuffer ifNotNil: [
	1 to: aBuffer size do: [:each | aBuffer at: each put: receivedDataStream next asInteger]
	]