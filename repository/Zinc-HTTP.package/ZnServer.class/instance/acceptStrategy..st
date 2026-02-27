options
acceptStrategy: strategy
	"Set the server accept strategy that controls how incoming connections are handled.
	If set to #unlimited, any incoming connection is accepted, 
	but could later on be refused when maximumNumberOfConcurrentConnections is reached, 
	in which case the connection is closed after sending a 503 Service Unavailable response.
	If set to #limited, incoming connections are accepted as long as maximumNumberOfConcurrentConnections has not yet been reached, 
	once it does, incoming connections are no longer accepted and the server waits for existing connections to close.
	In this case, 503 Service Unavailable responses are normally not sent."

	self assert: (#(limited unlimited) includes: strategy).

	self localOptions at: #acceptStrategy put: strategy
