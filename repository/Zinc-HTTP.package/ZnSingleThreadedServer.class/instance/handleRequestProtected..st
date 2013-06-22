request handling
handleRequestProtected: request
	"Handle request and return a response.
	If a Smalltalk Error is thrown, return a HTTP Server Error response."

	^ [ self authenticateAndDelegateRequest: request ]
		on: Error
		do: [ :exception | 
			self debugMode
				ifTrue: [ exception pass ]
				ifFalse: [
					self logServerError: exception. 
					ZnResponse serverError: exception printString ] ]