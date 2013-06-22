testing
testWriting256KiBSingleFrameUnmaskedBinaryMessage
	"Fifth example from RFC 6455 section 5.7"

	| reference payload bytes frame |
	payload := ZnWebSocketUtils randomByteArrayOfSize: (2 raisedTo: 16).
	reference := (ByteArray readHexFrom: '827f0000000000010000'), payload.
	frame := ZnWebSocketFrame bytes: payload.
	frame masked: false.
	bytes := ByteArray streamContents: [ :stream | frame writeOn: stream ].
	self assert: bytes equals: reference
