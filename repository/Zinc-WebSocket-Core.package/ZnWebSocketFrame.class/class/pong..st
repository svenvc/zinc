instance creation
pong: bytes
	^ self new
		opcode: 10;
		final: true;
		body: bytes;
		yourself