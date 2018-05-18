accessing-bytes
uint8: integer
	^ self nextIntegerOfSize: 1 signed: false bigEndian: true put: integer