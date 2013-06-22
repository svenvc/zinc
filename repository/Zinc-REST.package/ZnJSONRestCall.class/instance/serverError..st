error handling
serverError: message
	response := self delegate 
		serverError: request 
		exception: message