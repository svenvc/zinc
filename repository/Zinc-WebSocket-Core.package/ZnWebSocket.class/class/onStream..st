instance creation
onStream: socketStream
	"Return a new ZnWebSocket instance on socketStream.
	It is assumed that the initial handshake was successful."
	
	^ self new
		onStream: socketStream;
		yourself