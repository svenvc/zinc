instance creation
ping: bytes
	^ self new
		opcode: 9;
		final: true;
		body: bytes;
		yourself