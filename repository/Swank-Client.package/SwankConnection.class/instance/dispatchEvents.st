private dispatch
dispatchEvents
	[ [ (self isConnected and: [ self isAlive ])
		ifFalse: [ ^ self ].
	[ self dispatchEventOn: stream ]
		on: Error
		do: [ :err | 
			self logError: err.
			state package: nil ] ] repeat ]
		ifCurtailed: [ self disconnect ]