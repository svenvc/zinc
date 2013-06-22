accessing-query
queryAt: key
	^ self queryAt: key ifAbsent: [ KeyNotFound signalFor: key printString ]