printing
printOn: stream
	super printOn: stream.
	stream nextPut: $(; print: self totalDuration; nextPut: $)