accessing
port: integer
	"Set the port number we will be listening on.
	Cannot be changed after the server is already running."
	
	(self isRunning and: [ port ~= integer ]) 
		ifTrue: [ self error: 'Stop me before changing my port' ].
	port := integer