connection
send: aCommand 
	"returns a promise that will result in the answer to the command"
	| exp message size utf8Message utf8Size |
	exp := aCommand render: self state.
	message := exp printStringForLisp: lisp.
	utf8Message := self utf8Converter convertFromSystemString: message.
	"one more octet length for newline character at the end"
	size := utf8Message size + 1
				printPaddedWith: $0
				to: 6
				base: 16.
	utf8Size := self utf8Converter convertFromSystemString: size asLowercase.
	self logger debug: 'sending: ' object: utf8Size, utf8Message, Character linefeed asString.
	self stream nextPutAll: utf8Size.
	self stream nextPutAll: utf8Message.
	self stream nextPut: Character linefeed.
	self stream flush.
	^ aCommand promise