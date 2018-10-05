socket protocol
dataAvailable
	^ receivedDataStream notNil
		and: [receivedDataStream atEnd not] and: [receivedDataStream isEmpty not]