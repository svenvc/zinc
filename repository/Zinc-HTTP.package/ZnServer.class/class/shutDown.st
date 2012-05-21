system startup
shutDown
	"Our system shutDown hook: stop all servers we manage"
	
	self managedServers do: [ :each | each stop: false ]