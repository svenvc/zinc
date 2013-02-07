private
sendText: string
	"Send string in one textual frame"

	| frame |
	frame := ZnWebSocketFrame text: string.
	self sendFrame: frame