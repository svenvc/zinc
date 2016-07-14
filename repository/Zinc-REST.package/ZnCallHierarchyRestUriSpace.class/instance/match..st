public
match: request
	| subclasses |
	subclasses := rootClass withAllSubclasses sorted: [ :x :y | x order <= y order ].
	subclasses do: [ :each |
		(each match: request)
			ifNotNil: [ :variables |
				^ each new
					variables: variables;
					yourself ] ].
	^ nil  