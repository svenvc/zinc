error handling
serverError: request exception: exception
	^ self 
		errorResponse: request 
		code: 500 
		message: exception asString