accessing
nameSymbol
	| name |
	name := self packageName.
	^ name
		ifNotNil: [(':' , name asLowercase) asSymbol]