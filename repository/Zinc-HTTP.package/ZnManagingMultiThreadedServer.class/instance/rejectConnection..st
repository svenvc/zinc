private
rejectConnection: socketStream
	| response |
	response := ZnResponse serviceUnavailable: 'Too many concurrent connections'.
	response setConnectionClose.
	response writeOn: socketStream.
	self logConnectionRejected: socketStream.
	self closeSocketStream: socketStream.
	ZnTooManyConcurrentConnections signal