private
initializeServerSocket
	"Set up a new server socket and listen on it"
	
	self log debug: 'Initializing server socket'.
	serverSocket := interface
		ifNil: [ ZnNetworkingUtils serverSocketOn: port ]
		ifNotNil: [ ZnNetworkingUtils serverSocketOn: port interface: interface ]