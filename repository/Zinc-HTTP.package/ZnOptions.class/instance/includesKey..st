testing
includesKey: key
	^ (options notNil and: [ options includesKey: key ])
		or: [ parent notNil and: [ parent includesKey: key ] ]