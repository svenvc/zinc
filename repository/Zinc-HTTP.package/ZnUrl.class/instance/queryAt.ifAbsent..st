accessing-query
queryAt: key ifAbsent: block
	^ self hasQuery
		ifTrue: [ self query at: key ifAbsent: block ]
		ifFalse: [ block value ]