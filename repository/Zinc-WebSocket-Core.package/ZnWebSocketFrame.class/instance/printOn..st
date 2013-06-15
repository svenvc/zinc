printing
printOn: stream
	super printOn: stream.
	stream 
		nextPut: $(; 
		print: self opcodeName;
		space;
		print: self size; nextPut: $B; 
		space;
		nextPutAll: (final ifTrue: [ 'final' ] ifFalse: [ 'non-final' ]);
		nextPut: $)