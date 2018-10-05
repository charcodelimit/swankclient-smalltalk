testing
functionHasPackagePrefix
	| fun colon |
	fun := self function.
	colon := fun
				ifNotNil: [fun
						indexOf: $:
						ifAbsent: []].
	^ colon
		ifNil: [false]
		ifNotNil: [true]