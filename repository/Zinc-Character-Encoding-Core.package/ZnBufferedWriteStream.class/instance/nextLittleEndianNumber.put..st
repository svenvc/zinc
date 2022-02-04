accessing - bytes
nextLittleEndianNumber: numberOfBytes put: integer
	^ self nextIntegerOfSize: numberOfBytes signed: false bigEndian: false put: integer