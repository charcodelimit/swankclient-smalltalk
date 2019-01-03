private dispatch
startDispatching
	self stopDispatching.
	self isConnected
		ifTrue: [ mutex critical: [ internalConnectionState := #alive ] ].
	process := [ [ self dispatchEvents ] repeat ]
		forkAt: Processor highIOPriority
		named: self class name.
	self logger info: ' Started ' , self class name