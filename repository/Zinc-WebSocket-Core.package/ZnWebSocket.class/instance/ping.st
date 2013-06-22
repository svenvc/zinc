protocol
ping
	"Send a ping frame."

	| frame |
	frame := ZnWebSocketFrame ping: ZnWebSocketUtils newPingPayload.
	self sendFrame: frame