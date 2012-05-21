accessing-query
queryAt: key
	^ self hasQuery
		ifTrue: [ self query at: key ]
		ifFalse: [ KeyNotFound signalFor: key printString ]