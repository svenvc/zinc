protocol
handleControlFrameNoWait
	"Peek for a control frame if any and handle it. Do not wait.
	Return true when a control frame was handled, false otherwise."
	
	(stream isDataAvailable and: [ (stream peek bitAnd: 127) > 7 ])
		ifTrue: [ | frame |
			frame := ZnWebSocketFrame readFrom: stream.
			self handleControlFrame: frame.
			^ true ].
	^ false