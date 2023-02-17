public
handleRequest: request
	"Dispatch on the different REST calls that I implement"

	^ request uri pathSegments size = 1
		ifTrue: [ self handleStoreContents ]
		ifFalse: [
			request uri pathSegments size = 2
				ifTrue: [
					request method = #GET
						ifTrue: [ ^ self handleGetKey: request ].
					request method = #DELETE
						ifTrue: [ ^ self handleDeleteKey: request ].
					(request method = #PUT
							and: [ request entity contentType matches: ZnMimeType textPlain ])
						ifTrue: [ ^ self handlePutKey: request ] ].
			ZnResponse badRequest: request ]