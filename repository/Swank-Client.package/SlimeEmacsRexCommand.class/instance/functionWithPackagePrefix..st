rendering
functionWithPackagePrefix: aPackage 
	^ self functionHasPackagePrefix
		ifTrue: [self function]
		ifFalse: [(aPackage packageName , '::' , self function) asSymbol]