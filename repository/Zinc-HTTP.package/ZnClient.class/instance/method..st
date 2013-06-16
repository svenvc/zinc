accessing request
method: httpMethod
	"Set the HTTP method of the current request to httpMethod.
	An uppercase symbol such as #GET is expected."

	(#(#GET #HEAD) includes: httpMethod)
		ifTrue: [ self resetEntity ].
	request method: httpMethod