instance creation
text: string
	^ self new
		opcode: 1;
		final: true;
		text: string;
		yourself