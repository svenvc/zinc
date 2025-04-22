accessing
at: key
	options ifNotNil: [ options at: key ifPresent: [ :value | ^ value ] ].
	^ parent
		ifNil: [ KeyNotFound signalFor: key in: self ]
		ifNotNil: [ parent at: key ]