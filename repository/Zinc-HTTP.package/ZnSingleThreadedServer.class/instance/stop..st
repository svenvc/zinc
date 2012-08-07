public
stop: unregister
	"Stop me. I will stop listening on my port for incoming HTTP connections.
	If unregister is true, unregister me from the list of managed instances.
	Does nothing when I am not running"
	
	self isRunning 
		ifFalse: [ 
			unregister ifTrue: [ self unregister ].
			process := nil.
			^ self ].
	process terminate. 
	process := nil.
	unregister ifTrue: [ self unregister ].
	self closeDelegate.
	self log info: [ 'Stopped ', self serverProcessName ]