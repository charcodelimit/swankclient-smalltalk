private dispatch
receiveData
	| hexSize size |
	hexSize := stream next: 6.
	size := Integer readFrom: hexSize base: 16.
	size > (1 << 24)
		ifTrue: [Error signal: 'Buffer size overrun'].
	^ stream next: size.