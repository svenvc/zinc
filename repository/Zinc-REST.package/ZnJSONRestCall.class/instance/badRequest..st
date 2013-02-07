error handling
badRequest: message
	response := self delegate 
		errorResponse: request 
		code: 400 
		message: message