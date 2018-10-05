tests
testHomeDirectory
	| server directory parts |
	server := SwankServer host: 'localhost'.
	directory := server homeDirectory.
	self assert: directory notNil.
	parts := directory pathSegments.
	self assert: (parts at: (parts size - 1)) = 'home'
	