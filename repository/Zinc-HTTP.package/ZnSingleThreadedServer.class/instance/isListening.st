testing
isListening
	"Return true when I have a valid server socket listening at the correct port"
	
	^ self serverSocket notNil
		and: [ self serverSocket isValid and: [ 
			"port is not available from socket on all platforms, we'll have to trust #isValid"
			true or: [self serverSocket localPort = self port ] ] ]