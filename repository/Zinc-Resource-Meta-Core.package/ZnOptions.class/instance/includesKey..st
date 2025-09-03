testing
includesKey: key
	^ (options isNotNil and: [ options includesKey: key ])
		or: [ parent isNotNil and: [ parent includesKey: key ] ]