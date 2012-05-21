logging
logRequest: request
	"Log a request that was just read"
	
	self log info: [ 
		lastRequest := request.
		'Read ', request printString ]