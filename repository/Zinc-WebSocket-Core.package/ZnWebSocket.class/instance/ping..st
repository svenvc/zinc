protocol
ping: payload
	"Send a ping frame with payload"

	| frame |
	frame := ZnWebSocketFrame ping: payload.
	self sendFrame: frame