testing
testReading256KiBSingleFrameUnmaskedBinaryMessage
	"Fifth example from RFC 6455 section 5.7"

	| payload bytes frame |
	payload := ZnWebSocketUtils randomByteArrayOfSize: (2 raisedTo: 16).
	bytes := (ByteArray readHexFrom: '827f0000000000010000'), payload.
	frame := ZnWebSocketFrame readFrom: bytes readStream.
	self assert: frame isBinary.
	self deny: frame isMasked.
	self assert: frame isFinal.
	self assert: frame size equals: (2 raisedTo: 16).
	self assert: frame body equals: payload.
