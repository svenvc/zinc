error handling
wrongMethod: request
	^ self 
		errorResponse: request 
		code: 405 
		message: 'Wrong HTTP method'