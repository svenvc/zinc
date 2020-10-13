public
handleRequest: request
	"Server delegate entry point"
	
	(prefix isNil or: [ prefix = request uri pathSegments ])
		ifFalse: [ ^ ZnResponse notFound: request uri ].
	^ (self isValidWebSocketRequest: request)
			ifTrue: [ self webSocketResponseForRequest: request ]
			ifFalse: [ ZnResponse badRequest: request ]