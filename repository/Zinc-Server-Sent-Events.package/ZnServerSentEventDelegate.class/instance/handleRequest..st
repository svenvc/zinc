public
handleRequest: request
	(prefix isNil or: [ prefix = request uri pathSegments ])
		ifFalse: [ ^ ZnResponse notFound: request uri ].
	^ self serverSentEventResponse