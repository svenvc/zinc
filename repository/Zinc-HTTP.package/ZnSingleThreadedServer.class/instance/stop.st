as yet unclassified
stop
	"Stop me. I will stop listening on my port for incoming HTTP connections.
	Does nothing when I am not running"
	
	self isRunning ifTrue: [ serverSocket close.
		process terminate. 
		process := nil.
		self log info: [ 'Stopped ', self serverProcessName ] ]