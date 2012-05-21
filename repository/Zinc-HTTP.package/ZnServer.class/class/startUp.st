system startup
startUp
	"Our system startUp hook: start all servers we manage"

	self managedServers do: [ :each | each start ]