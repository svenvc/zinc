public
handleRequest: request
	request uri firstPathSegment = 'repl'
		ifTrue: [
			request method = #GET
				ifTrue: [
					^ self handleGetRequest: request ].
			(request method = #POST and: [ request hasEntity and: [ request contentType isBinary not ] ])
				ifTrue: [
					^ self handlePostRequest: request ] ].
	(request uri firstPathSegment = 'display' and: [ request method = #GET ])
		ifTrue: [ ^ self handleDisplayRequest ].
	^ ZnResponse notFound: request uri