protocol
sendTextFrames: sequenceableCollection
	"Send a textual message consisting of sequenceableCollection string frames"

	| frame |
	self assert: sequenceableCollection size > 1.
	(frame := ZnWebSocketFrame text: sequenceableCollection first)
		final: false.
	self sendFrame: frame.
	2 to: sequenceableCollection size - 1 do: [ :each |
		(frame := ZnWebSocketFrame text: (sequenceableCollection at: each))
			final: false; opcode: 0.
		self sendFrame: frame ].
	(frame := ZnWebSocketFrame text: sequenceableCollection last)
		final: true; opcode: 0.
	self sendFrame: frame
	