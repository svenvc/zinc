public
match: request
	rootClass subclassesDo: [ :each |
		(each match: request)
			ifNotNil: [ :variables |
				^ each new
					variables: variables;
					yourself ] ].
	^ nil  