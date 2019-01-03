tests
testSendLispFunctionCommand
	| stream promise |
	stream := self setUpStream.
	connection connect.
	promise := connection send: (SlimeLispFunctionCommand function: #+ arguments: {2 . 3}).
	self assert: (promise isKindOf: Promise).
	self
		assert: stream getSentData
		equals:
			'00003c(:emacs-rex (COMMON-LISP-USER::+ 2 3) :common-lisp-user t 1)'