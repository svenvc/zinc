as yet unclassified
setUp
	| listener clientSocket serverSocket |
	listener := SocketStreamSocket newTCPSocket.
	[listener listenBackloggingUpTo: 4.

	clientSocket := SocketStreamSocket connectToServerOnHost: 'localhost' port: listener port.
"	clientSocket waitForConnectionFor: 1. "
	self assert: clientSocket isConnected.

"	serverSocket := listener waitForAcceptFor: 1. "
	serverSocket := listener accept.
	self assert: serverSocket isConnected.
	] ensure:[listener close].

	clientStream := SocketStream on: clientSocket.
	serverStream := SocketStream on: serverSocket.