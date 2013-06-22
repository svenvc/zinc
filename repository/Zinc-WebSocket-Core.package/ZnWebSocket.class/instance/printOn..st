printing
printOn: aStream
	super printOn: aStream.
	aStream 
		nextPut: $(; 
		print: role;
		nextPut: $)