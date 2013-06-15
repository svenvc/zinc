protocol
sendByteFrames: sequenceableCollection
	"Send a binary message consisting of sequenceableCollection byte array frames"

	| frame |
	self assert: sequenceableCollection size > 1.
	(frame := ZnWebSocketFrame bytes: sequenceableCollection first)
		final: false.
	self sendFrame: frame.
	2 to: sequenceableCollection size - 1 do: [ :each |
		(frame := ZnWebSocketFrame bytes: (sequenceableCollection at: each))
			final: false; opcode: 0.
		self sendFrame: frame ].
	(frame := ZnWebSocketFrame bytes: sequenceableCollection last)
		final: true; opcode: 0.
	self sendFrame: frame
	