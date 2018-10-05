processing
processValue: aValue state: aSwankConnectionState 
	| value key indent |
	value := aValue car.
	value do: [:each| 
		key := each car. indent := each cadr. 
		aSwankConnectionState symbol: key indent: indent]
	