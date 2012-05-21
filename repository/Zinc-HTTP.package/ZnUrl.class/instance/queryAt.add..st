accessing-query
queryAt: key add: value
	query isNil 
		ifTrue: [ query := ZnMultiValueDictionary new ].
	query at: key add: value