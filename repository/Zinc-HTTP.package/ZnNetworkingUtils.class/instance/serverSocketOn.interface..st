public
serverSocketOn: port interface: address
	| socket |
	socket := SocketStreamSocket newTCPSocket.
	self setServerSocketOptions: socket.
	socket 
		listenOn: port 
		backlogSize: self class listenBacklogSize 
		interface: address.
	socket isValid
		ifFalse: [ self error: 'Cannot create socket on port ', port printString ].
	^ socket