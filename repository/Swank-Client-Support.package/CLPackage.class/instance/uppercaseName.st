accessing
uppercaseName
	|name|
	name := self packageName.
	^ name ifNotNil: [name asUppercase].