testing
isConnectionKeepAlive
	| value |
	value := self headers singleAt: 'Connection' ifAbsent: [ ^ false ].
	^ value sameAs: 'keep-alive'