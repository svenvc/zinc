printing
printOn: stream
	super printOn: stream.
	self host notNil ifTrue: [
		stream nextPut: $(; nextPutAll: 'http://'; nextPutAll: self host; nextPut: $:; print: self port; nextPut: $) ]