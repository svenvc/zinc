protocol
pingRandom
	"Send a ping with a 4-byte random payload."

	self ping: ZnWebSocketUtils newPingPayload