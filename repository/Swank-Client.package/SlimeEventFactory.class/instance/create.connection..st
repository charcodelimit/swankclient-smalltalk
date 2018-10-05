factory
create: anId connection: aSwankConnection 
	|  event eventClass |
	event := nil.
	anId
		ifNotNil: [
			eventClass := self class events
						at: anId
						ifAbsent: [].
			event := eventClass
						ifNotNil: [eventClass with: aSwankConnection]].
	^ event