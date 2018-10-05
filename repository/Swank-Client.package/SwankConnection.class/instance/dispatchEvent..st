private dispatch
dispatchEvent: aByteArray 
	| exp event eventId value string decodedString |
	string := aByteArray asString.
	decodedString := utf8Converter convertToSystemString: string.
	self logger debug: 'dispatching event: ' object: decodedString.
	exp := self lisp reader read: decodedString readStream.
	exp
		ifNotNil: [exp isConsCell
				ifTrue: [eventId := exp car.
					value := exp cdr.
					event := self eventFactory create: eventId connection: self.
					event
						ifNil: [self logger warn: 'unsupported event: ' object: eventId]
						ifNotNil: [event processValue: value state: self state]]
				ifFalse: [self logger error: 'unreadable value: ' object: exp]]