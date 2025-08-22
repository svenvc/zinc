accessing
numberOfOpenConnections
	^ self hasOpenConnections
		ifTrue: [ connections size ]
		ifFalse: [ 0 ]