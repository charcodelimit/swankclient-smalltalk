accessing
popRequest: aMessageId
	^requests removeKey: aMessageId ifAbsent: [nil]