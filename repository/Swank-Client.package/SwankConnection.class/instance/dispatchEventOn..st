private dispatch
dispatchEventOn: aSocketStream
	| data |
	aSocketStream isDataAvailable
		ifFalse: [ aSocketStream socket waitForDataIfClosed: [  ].
			^ self ].
	data := self readDataFrom: aSocketStream.
	self dispatchEvent: data