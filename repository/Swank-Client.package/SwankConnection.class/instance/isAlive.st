testing
isAlive
	^ mutex critical: [ internalConnectionState = #alive ]