accessing-bytes
nextNumber: numberOfBytes put: integer
	^ self nextIntegerOfSize: numberOfBytes signed: false bigEndian: true put: integer