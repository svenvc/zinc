testing
testReadingPing
	"Fourth example from RFC 6455 section 5.7"

	| bytes frame |
	bytes := ByteArray readHexFrom: '890548656c6c6f'.
	frame := ZnWebSocketFrame readFrom: bytes readStream.
	self assert: frame isPing.
	self deny: frame isMasked.
	self assert: frame isFinal.
	self assert: frame text equals: 'Hello'.
