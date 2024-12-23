error handling
errorIllegalLeadingByte: byte from: stream
	^ self error: 'Illegal leading byte for utf-8 encoding'