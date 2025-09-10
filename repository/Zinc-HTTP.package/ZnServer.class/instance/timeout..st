options
timeout: seconds
	"Set the timeout for network socket stream operations
	like connecting, reading and writing to seconds."

	self localOptions at: #socketStreamTimeout put: seconds