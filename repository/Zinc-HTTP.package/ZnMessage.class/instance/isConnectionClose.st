testing
isConnectionClose
	| value |
	value := self headers singleAt: 'Connection' ifAbsent: [ ^ false ].
	^ value sameAs: 'close'