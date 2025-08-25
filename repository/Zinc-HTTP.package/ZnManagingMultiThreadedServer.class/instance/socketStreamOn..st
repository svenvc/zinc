private
socketStreamOn: socket
	| socketStream |
	socketStream := super socketStreamOn: socket.
	self numberOfOpenConnections > (ZnCurrentOptions at: #maximumNumberOfConcurrentConnections)
		ifTrue: [ ^ self rejectConnection: socketStream ].
	self lock critical: [
		self connections add: socketStream ].
	^ socketStream