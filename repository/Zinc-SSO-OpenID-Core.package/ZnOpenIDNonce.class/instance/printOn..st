printing
printOn: aStream

	aStream nextPutAll: (self class encodeRFC3339Date: self timestamp).
	self distinctor isNil ifFalse: [ aStream nextPutAll: self distinctor ]