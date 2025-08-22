options
listenBacklogSize: integer
	"Set my server socket listen backlog size, the number of pending connections queued up, waiting to be accepted, at any one time."

	self localOptions at: #listenBacklogSize put: integer