private dispatch
readDataFrom: aStream
	| hexSize size |
	hexSize := aStream next: 6.
	size := Integer readFrom: hexSize base: 16.
	size > (1 << 24)
		ifTrue: [ Error signal: 'Buffer size overrun' ].
	^ aStream next: size