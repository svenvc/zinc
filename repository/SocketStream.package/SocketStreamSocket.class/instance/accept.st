as yet unclassified
accept
	"^an SpSocket
	I accept the next connection made to the server socket I represent.  I return a new
	instance of SpSocket which represents the socket over which information can be
	exchanged.
	NOTE: this call will block waiting for an inbound connection"

	^SocketStreamSocket onNativeclientSocket: (self underlyingSocket accept) for: self
