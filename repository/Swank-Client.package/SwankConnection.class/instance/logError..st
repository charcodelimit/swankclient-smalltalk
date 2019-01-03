logging
logError: anError
	| message |
	message := String
		streamContents: [ :s | 
			s << anError printString; cr.
			anError signalerContext shortDebugStackOn: s ].
	logger error: message locationInfo: anError signalerContext