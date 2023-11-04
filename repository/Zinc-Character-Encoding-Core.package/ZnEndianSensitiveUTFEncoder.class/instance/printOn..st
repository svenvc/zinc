printing
printOn: stream
	super printOn: stream.
	stream nextPut: $(.
	stream print: self identifier asString; space.
	stream nextPutAll: endianness; nextPutAll: ' endian'.
	stream nextPut: $)