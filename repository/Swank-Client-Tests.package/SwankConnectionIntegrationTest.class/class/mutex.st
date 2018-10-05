accessing
mutex
	^ mutex
		ifNil: [mutex := Semaphore new]