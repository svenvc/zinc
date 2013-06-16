private
pong: payload
	"Send a pong frame containing payload (in reply to a ping with that payload)"
	
	| frame |
	frame := ZnWebSocketFrame pong: payload.
	self sendFrame: frame 