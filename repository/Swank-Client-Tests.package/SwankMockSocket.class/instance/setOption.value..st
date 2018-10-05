socket protocol
setOption: aName value: aValue 
	options ifNil: [options := Dictionary new].
	options at: aName put: aValue