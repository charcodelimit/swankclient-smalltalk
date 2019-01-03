processing
processValue: aValue state: aSwankConnectionState
	| package prompt |
	package := aValue car.
	prompt := aValue cadr.
	aSwankConnectionState package: (CLPackage named: package).
	aSwankConnectionState prompt: prompt