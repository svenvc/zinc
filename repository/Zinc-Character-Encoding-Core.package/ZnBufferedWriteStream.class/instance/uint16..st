accessing-bytes
uint16: integer
	^ self nextIntegerOfSize: 2 signed: false bigEndian: true put: integer