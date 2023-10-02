printing
printContentsOn: stream
	super printContentsOn: stream.

	stream << 'Connection Closed '.
	self class printAddress: address on: stream.
	stream nextPut: $:; print: port