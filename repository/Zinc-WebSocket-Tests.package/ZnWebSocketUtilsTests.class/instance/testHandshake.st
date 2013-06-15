testing
testHandshake
	"From the example in RFC 6455 section 1.3 page 8"
	
	self 
		assert: (ZnWebSocketUtils handshake: 'dGhlIHNhbXBsZSBub25jZQ==')
		equals: 's3pPLMBiTxaQ9kYGzzhZRbK+xOo='