testing
testReadingSingleFrameUnmaskedTextMessage
	"First example from RFC 6455 section 5.7"

	| bytes frame |
	bytes := ByteArray readHexFrom: '810548656c6c6f'.
	frame := ZnWebSocketFrame readFrom: bytes readStream.
	self assert: frame isText.
	self deny: frame isMasked.
	self assert: frame isFinal.
	self assert: frame contents equals: 'Hello'