printing
printOn: stream
	self printHeaderOn: stream.
	stream space.
	self printContentsOn: stream