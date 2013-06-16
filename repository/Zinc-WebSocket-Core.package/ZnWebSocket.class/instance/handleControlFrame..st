private
handleControlFrame: frame
	"Handle a control frame. ConnectionClosed is signalled when the other end closes."
	
	frame isClose 
		ifTrue: [ 
			self log debug: 'Handling close frame'.
			self close. 
			^ self signalClosed: frame ].
	frame isPing 
		ifTrue: [ 
			self log debug: 'Handling ping frame'.
			self pong: frame body ].
	frame isPong 
		ifTrue: [
			self log debug: 'Handling pong frame' ]