printing
printContentsOn: stream

	super printContentsOn: stream.
	self bytes ifNotNil: [
		stream
			space;
			print: self bytes ]