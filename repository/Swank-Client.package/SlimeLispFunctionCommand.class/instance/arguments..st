accessing
arguments: anObject 
	arguments := anObject isCollection ifTrue: [ConsCell fromList: anObject] ifFalse: [ConsCell car: anObject cdr: nil].