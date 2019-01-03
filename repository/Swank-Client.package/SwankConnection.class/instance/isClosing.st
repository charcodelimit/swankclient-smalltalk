testing
isClosing
	^ mutex critical: [ internalConnectionState = #closing ]