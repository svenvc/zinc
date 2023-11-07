printing
printContentsOn: stream

	super printContentsOn: stream.
	self string ifNotNil: [
		stream
			space;
			nextPutAll: self string ]