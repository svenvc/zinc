error handling
noHandlerFound: request
	^ self 
		errorResponse: request 
		code: 404 
		message: 'No handler found'