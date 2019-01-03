testing
isDead
	^ mutex critical: [ internalConnectionState = #dead ]