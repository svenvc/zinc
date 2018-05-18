accessing-bytes
uint32: integer
	^ self nextIntegerOfSize: 4 signed: false bigEndian: true put: integer