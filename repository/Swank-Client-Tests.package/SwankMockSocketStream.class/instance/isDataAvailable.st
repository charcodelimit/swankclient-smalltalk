testing
isDataAvailable
	^self inStream isEmpty ifTrue: [false]
		ifFalse: [true]