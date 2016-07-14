private
handleControlFrame: frame
	"Handle a control frame. ConnectionClosed is signalled when the other end closes."
	
	frame isClose 
		ifTrue: [ 
			self logControlFrameHandled: #close.
			self close. 
			^ self signalClosed: frame ].
	frame isPing 
		ifTrue: [ 
			self logControlFrameHandled: #ping.
			self pong: frame body ].
	frame isPong 
		ifTrue: [
			self logControlFrameHandled: #pong ]