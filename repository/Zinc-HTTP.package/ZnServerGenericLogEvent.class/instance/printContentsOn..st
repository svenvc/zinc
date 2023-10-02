printing
printContentsOn: stream
	super printContentsOn: stream.

	stream nextPutAll: subject asString