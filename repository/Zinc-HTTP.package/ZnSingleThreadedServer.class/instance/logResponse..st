logging
logResponse: response
	"Log a response that was just written"
	
	self log info: [ 
		lastResponse := response.
		'Wrote ', response printString ]