printing
printContentsOn: stream
	super printContentsOn: stream.

	stream << 'Server Connection Closed'.
	self class printAddress: address on: stream 