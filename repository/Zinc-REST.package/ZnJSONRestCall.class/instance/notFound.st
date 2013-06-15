error handling
notFound
	response := self delegate 
		errorResponse: request 
		code: 404 
		message: 'Resource not found during ', self class name