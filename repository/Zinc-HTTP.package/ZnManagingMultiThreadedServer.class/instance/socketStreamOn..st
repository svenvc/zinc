private
socketStreamOn: socket
	| socketStream |
	socketStream := super socketStreamOn: socket.
	self connections size >= (ZnCurrentOptions at: #maximumNumberOfConcurrentConnections)
		ifTrue: [ ^ self rejectConnection: socketStream ].
	self lock critical: [
		self connections add: socketStream ].
	^ socketStream