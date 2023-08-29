*Zinc-HTTP-UnixSocket
newIPC
	"Create a socket and initialise it for IPC aka Unix domain."

	self initializeNetwork.
	^ [ super new initialize: TCPSocketType withDomain: 1 ]
		repeatWithGCIf: [ :socket | socket isValid not ]