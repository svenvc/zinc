options
maximumNumberOfConcurrentConnections: count
	"Set the maximum number of concurrent connections that I will accept.
	When this threshold is reached, a 503 Service Unavailable response will be sent
	and the connection will be closed.
	It is possible to raise this number when other system parameters are adjusted as well."
	
	self localOptions at: #maximumNumberOfConcurrentConnections put: count