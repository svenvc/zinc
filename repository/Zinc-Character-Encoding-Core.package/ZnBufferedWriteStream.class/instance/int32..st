accessing - bytes
int32: integer
	^ self nextIntegerOfSize: 4 signed: true bigEndian: true put: integer