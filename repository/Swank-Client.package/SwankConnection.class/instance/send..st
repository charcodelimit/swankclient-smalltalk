connection
send: aCommand
	"returns a promise that will result in the answer to the command"

	| exp message |
	exp := aCommand render: self state.
	message := exp printStringForLisp: lisp.
	self sendMessageString: message.
	^ aCommand promise