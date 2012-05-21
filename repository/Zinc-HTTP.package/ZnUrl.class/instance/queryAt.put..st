accessing-query
queryAt: key put: value
	query isNil 
		ifTrue: [ query := ZnMultiValueDictionary new ].
	query at: key put: value