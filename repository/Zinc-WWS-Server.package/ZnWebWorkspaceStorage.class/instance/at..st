accessing
at: key
	^ self at: key ifAbsent: [ KeyNotFound signalFor: key ]