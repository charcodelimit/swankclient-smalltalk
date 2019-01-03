private connection
sendMessageString: aMessageString
	"creates a package from the raw message string and sends it"

	| size utf8Message utf8Size |
	utf8Message := self utf8Converter convertFromSystemString: aMessageString.
	"one more octet length for newline character at the end"
	size := utf8Message size printPaddedWith: $0 to: 6 base: 16.
	utf8Size := self utf8Converter convertFromSystemString: size asLowercase.
	self logger
		debug: 'sending: '
		object: utf8Size , utf8Message , Character linefeed asString.
	self stream nextPutAll: utf8Size.
	self stream nextPutAll: utf8Message.
	self stream flush