testing
testReadingFragmentedUnmaskedTextMessage
	"Third example from RFC 6455 section 5.7"

	| bytes stream frame |
	bytes := ByteArray readHexFrom: '010348656c80026c6f'.
	stream := bytes readStream.
	frame := ZnWebSocketFrame readFrom: stream.
	self assert: frame isText.
	self deny: frame isMasked.
	self deny: frame isFinal.
	self assert: frame text equals: 'Hel'.
	self deny: stream atEnd.
	frame := ZnWebSocketFrame readFrom: stream.
	self assert: frame isContinuation.
	self deny: frame isMasked.
	self assert: frame isFinal.
	self assert: frame text equals: 'lo'.
	self assert: stream atEnd.
	