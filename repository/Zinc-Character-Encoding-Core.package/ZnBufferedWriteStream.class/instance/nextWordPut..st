accessing-bytes
nextWordPut: integer
	^ self nextIntegerOfSize: 2 signed: false bigEndian: true put: integer