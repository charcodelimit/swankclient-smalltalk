processing
processValue: aValue state: aSwankConnectionState 
	| package prompt |
	self halt.
	package := aValue car.
	prompt := aValue cadr.
	aSwankConnectionState
		package: (CLPackage named: package).
	aSwankConnectionState prompt: prompt