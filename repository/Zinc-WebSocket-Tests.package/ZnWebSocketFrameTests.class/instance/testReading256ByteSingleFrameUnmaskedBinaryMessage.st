testing
testReading256ByteSingleFrameUnmaskedBinaryMessage
	"Fifth example from RFC 6455 section 5.7"

	| payload bytes frame |
	payload := ZnWebSocketUtils randomByteArrayOfSize: 256.
	bytes := (ByteArray readHexFrom: '827e0100'), payload.
	frame := ZnWebSocketFrame readFrom: bytes readStream.
	self assert: frame isBinary.
	self deny: frame isMasked.
	self assert: frame isFinal.
	self assert: frame size equals: 256.
	self assert: frame body equals: payload.
