instance creation
bytes: byteArray
	^ self new
		opcode: 2;
		final: true;
		body: byteArray;
		yourself