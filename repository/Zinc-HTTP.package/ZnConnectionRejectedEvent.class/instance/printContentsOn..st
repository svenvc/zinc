printing
printContentsOn: stream
	super printContentsOn: stream.

	stream << 'Connection Rejected '.
	self class printAddress: address on: stream