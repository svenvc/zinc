accessing request
method: httpMethod
	"Set the HTTP method of the current request to httpMethod.
	An uppercase symbol such as #GET is expected."
	
	self resetRequestIfNeeded.
	request method: httpMethod