writing
writeOn: stream
	self initializeEncoder.
	self string do: [ :each | 
		encoder nextPut: each toStream: stream ]