testing
testWriting256ByteSingleFrameUnmaskedBinaryMessage
	"Fifth example from RFC 6455 section 5.7"

	| payload reference bytes frame |
	payload := ZnWebSocketUtils randomByteArrayOfSize: 256.
	reference := (ByteArray readHexFrom: '827e0100'), payload.
	frame := ZnWebSocketFrame bytes: payload.
	frame masked: false.
	bytes := ByteArray streamContents: [ :stream | frame writeOn: stream ].
	self assert: bytes equals: reference
