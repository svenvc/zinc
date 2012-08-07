public
handleRequest: request
	request uri isSlash
		ifTrue: [
			request method = #GET ifTrue: [ ^ self handleIndex: request ].
			request method = #POST ifTrue: [ ^ self handlePost: request ] ]
		ifFalse: [
			(request uri pathSegments size = 1 and: [ request method = #GET ])
				ifTrue: [ ^ self handleGet: request ] ].
	^ ZnResponse badRequest: request uri