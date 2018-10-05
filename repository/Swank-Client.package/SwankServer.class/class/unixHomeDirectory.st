accessing
unixHomeDirectory
	"the Unix home directory"
	| defaultDir parts index homeDirectory |
	defaultDir := FileSystem workingDirectory.
	parts := defaultDir pathSegments.
	index := parts
				indexOf: 'home'
				ifAbsent: [].
	homeDirectory := nil.
	index
		ifNotNil: [homeDirectory := FileSystem root.
			parts
				from: 1
				to: index + 1
				do: [:each | homeDirectory := homeDirectory resolve: each]].
	^ homeDirectory