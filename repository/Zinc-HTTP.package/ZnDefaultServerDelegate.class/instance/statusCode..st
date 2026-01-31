responses
statusCode: request
	"Reply with a specific status code, read from the URI, as in /status-code/404.
	If no code was requested, return an overview of know status codes.
	If an unknown status code is requested, return a 404 Not found"

	request uri pathSegments size = 1 
		ifTrue: [ 
			^ ZnResponse ok: (ZnEntity html: self generateStatusCodesOverview) ].
	request uri pathSegments size = 2
		ifTrue: [ | code response entity |
			code := Integer readFrom: request uri lastPathSegment ifFail: [ -1 ].
			[ 
				response := ZnResponse statusCode: code.
				entity := ZnEntity textCRLF: ('{1} {2}' format: { 
								response statusLine code. response statusLine reason }).
				response entity: entity.
				^ response ] 
					on: ZnUnknownHttpStatusCode 
					do: [ ^ ZnResponse notFound: request uri ] ].
	^ ZnResponse badRequest: request