logging
initializeLogger
	| appender |
	EsLogManager singleton level: EsLevel All.
	logger := EsLogManager createLogger: self class name.
	appender := EsTranscriptAppender
				level: EsLevel All
				layout: (EsPatternLayout new: '[%d] %m %o').
	logger addAppender: appender