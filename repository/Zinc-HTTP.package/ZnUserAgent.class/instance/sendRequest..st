private-protocol
sendRequest: stream
	self log debug: [ request printString ].
	request writeOn: stream.
	stream flush.
	^ self processResponse: stream