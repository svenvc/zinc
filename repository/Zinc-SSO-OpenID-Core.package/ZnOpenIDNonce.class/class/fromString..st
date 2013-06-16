instance creation
fromString: aByteString

	^ self new
		parseString: aByteString;
		yourself