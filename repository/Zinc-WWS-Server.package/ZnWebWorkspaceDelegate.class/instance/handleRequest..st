public
handleRequest: request
	request uri isSlash
		ifTrue: [ 
			request method = #GET ifTrue: [ ^ self handleIndex: request ].
			request method = #POST ifTrue: [ ^ self handlePost: request ] ]
		ifFalse: [ 
			request uri pathSegments size = 1
				ifTrue: [ 
					request uri firstPathSegment = #new
						ifTrue: [ 
							request method = #GET ifTrue: [ ^ self handleNewIndex: request ].
							request method = #POST ifTrue: [ ^ self handleNewPost: request ] ]
						ifFalse: [ 
							request method = #GET
								ifTrue: [ ^ self handleGet: request ] ] ] ].
	^ ZnResponse badRequest: request uri