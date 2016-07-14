error handling
handleException: exception request: request
	^request server debugMode
		ifTrue: [ exception pass ]
		ifFalse: [ 
			request server logServerHandlerError: exception.
			self serverError: request exception: exception ] 