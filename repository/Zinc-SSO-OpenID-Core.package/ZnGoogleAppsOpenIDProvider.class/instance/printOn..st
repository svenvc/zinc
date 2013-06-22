printing
printOn: stream

	super printOn: stream.
	stream
		nextPutAll: '-' ;
		print: self domain