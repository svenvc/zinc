initialize-release
close
	"Send a close frame and close the connection"

	self sendFrame: ZnWebSocketFrame close.
	stream close.