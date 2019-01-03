private dispatch
stopDispatching
	self isDispatching
		ifFalse: [ ^ self ].
	process terminate.
	process := nil.
	self logger info: ' Stopped ' , self class name