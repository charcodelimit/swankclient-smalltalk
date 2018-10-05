initialize-release
initialize
	lisp := LispKernel new.
	eventFactory := SlimeEventFactory new.
	utf8Converter := UTF8TextConverter new.
	state := SwankSessionState new.
	mutex := Mutex new.
	stream := nil.
	internalConnectionState := nil.
	listening := false.
	self initializeLogger