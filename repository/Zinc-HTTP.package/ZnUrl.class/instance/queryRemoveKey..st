accessing-query
queryRemoveKey: key
	self hasQuery
		ifTrue: [ self query removeKey: key ifAbsent: [ ] ]