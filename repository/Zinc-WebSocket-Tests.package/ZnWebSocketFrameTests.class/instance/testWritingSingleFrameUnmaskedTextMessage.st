testing
testWritingSingleFrameUnmaskedTextMessage
	"First example from RFC 6455 section 5.7"

	| reference bytes frame |
	frame := ZnWebSocketFrame text: 'Hello'.
	frame masked: false.
	bytes := ByteArray streamContents: [ :stream | frame writeOn: stream ].
	reference := ByteArray readHexFrom: '810548656c6c6f'.
	self assert: bytes equals: reference