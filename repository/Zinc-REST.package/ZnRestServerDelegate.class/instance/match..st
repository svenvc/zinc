public
match: request
	| call |
	(call := uriSpace match: request)
		ifNotNil: [
			call
				request: request; 
				delegate: self ].
	^ call
	