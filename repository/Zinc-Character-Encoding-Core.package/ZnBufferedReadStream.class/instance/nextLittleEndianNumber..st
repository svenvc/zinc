accessing-bytes
nextLittleEndianNumber: numberOfBytes
	^ self nextIntegerOfSize: numberOfBytes signed: false bigEndian: false