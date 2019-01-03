tests
testSendConnectionInfoCommand
	| stream promise |
	stream := self setUpStream.
	connection connect.
	promise := connection send: SlimeConnectionInfoCommand new.
	self assert: (promise isKindOf: Promise).
	self
		assert: stream getSentData
		equals:
			'00003a(:emacs-rex (swank:connection-info) :common-lisp-user t 1)'