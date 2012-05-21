options
beOneShot
	"Switch me to use connections only for a single request/response cycle.
	By default, I will keep HTTP connections open according to the HTTP 1.1 spec.
	When oneShot is true, I will add a Connection: close header to requests."
	
	self optionAt: #oneShot put: true   