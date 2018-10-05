testing
isListening
	^listening and: [listenProcess notNil and: [listenProcess isTerminated not]]