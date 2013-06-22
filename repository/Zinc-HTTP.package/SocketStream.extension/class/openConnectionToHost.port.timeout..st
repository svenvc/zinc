*zinc-http
openConnectionToHost: host port: portNumber timeout: timeout
	| socket |
	socket :=SocketStreamSocket newTCPSocket.
	socket connectTo: host port: portNumber.
	^(self on: socket) 
		timeout: timeout; 
		yourself