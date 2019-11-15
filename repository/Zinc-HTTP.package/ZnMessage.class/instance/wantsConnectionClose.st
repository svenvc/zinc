testing
wantsConnectionClose
	"Return if the HTTP protocol should close the connection after processing the receiver.
	True in case of the presense of an explicit connection close request header."

	^ self isConnectionClose