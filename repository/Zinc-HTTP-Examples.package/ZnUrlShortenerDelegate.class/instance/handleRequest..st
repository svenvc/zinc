request handling
handleRequest: request
	^ request method = #GET
		ifTrue: [ self handleGetRequest: request ]
		ifFalse: [ ZnResponse methodNotAllowed: request ]