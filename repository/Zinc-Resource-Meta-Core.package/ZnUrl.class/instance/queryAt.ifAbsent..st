accessing-query
queryAt: key ifAbsent: block
	^ self hasQuery
		ifTrue: [ self query at: key asString ifAbsent: block ]
		ifFalse: [ block value ]