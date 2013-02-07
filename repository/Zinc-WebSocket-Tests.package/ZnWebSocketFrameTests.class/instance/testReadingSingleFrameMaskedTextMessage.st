testing
testReadingSingleFrameMaskedTextMessage
	"Second example from RFC 6455 section 5.7"
	
	| bytes frame |
	bytes := ByteArray readHexFrom: '818537fa213d7f9f4d5158'.
	frame := ZnWebSocketFrame readFrom: bytes readStream.
	self assert: frame isText.
	self assert: frame isMasked.
	self assert: frame isFinal.
	self assert: frame contents equals: 'Hello'