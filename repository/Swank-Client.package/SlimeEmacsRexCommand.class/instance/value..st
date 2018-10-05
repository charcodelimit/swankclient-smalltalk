processing
value: aValue 
	| resultState resultValue |
	resultState := aValue car.
	resultValue := aValue cadr.
	resultState = #':ok'
		ifTrue: [promise resolveWith: resultValue]
		ifFalse: [
	resultState = #':abort'
		ifTrue: [self
				rejectWith: (SlimeLispError signal: resultValue)]
		ifFalse: [self rejectWith: (SlimeError signal: 'Invalid result state', resultState asString)]]