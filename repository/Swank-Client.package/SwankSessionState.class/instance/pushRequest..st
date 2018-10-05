accessing
pushRequest: anEmacsRex 
	| nextId |
	nextId := self nextMessageId.
	anEmacsRex messageId: nextId.
	requests at: nextId put: anEmacsRex.