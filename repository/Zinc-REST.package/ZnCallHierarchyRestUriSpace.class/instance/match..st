public
match: request
	rootClass withAllSubclassesDo: [ :each |
		(each match: request)
			ifNotNil: [ :variables |
				^ each new
					variables: variables;
					yourself ] ].
	^ nil