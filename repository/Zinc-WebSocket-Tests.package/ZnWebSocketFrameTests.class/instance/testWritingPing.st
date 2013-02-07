testing
testWritingPing
	"Fourth example from RFC 6455 section 5.7"

	| reference bytes frame |
	reference := ByteArray readHexFrom: '890548656c6c6f'.
	frame := ZnWebSocketFrame ping: 'Hello' asByteArray.
	frame masked: false.
	bytes := ByteArray streamContents: [ :stream | frame writeOn: stream ].
	self assert: bytes equals: reference
