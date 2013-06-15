private
sendBytes: bytes
	"Send bytes in one binary frame"

	| frame |
	frame := ZnWebSocketFrame bytes: bytes.
	self sendFrame: frame