rendering
render: aState 
	| command |
	aState pushRequest: self.
	command := self function
				ifNotNil: [ConsCell car: (self functionWithPackagePrefix: aState package) cdr: self arguments].
	^ ConsCell fromList: {#':emacs-rex'. command. aState package nameSymbol. self thread. self messageId}