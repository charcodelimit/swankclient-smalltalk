processing
processValue: aValue state: aSwankConnectionState 
	| thread id |
	self halt.
	thread := aValue car.
	id := aValue cadr.
	connection
		send: (SlimeEmacsPongCommand thread: thread id: id)