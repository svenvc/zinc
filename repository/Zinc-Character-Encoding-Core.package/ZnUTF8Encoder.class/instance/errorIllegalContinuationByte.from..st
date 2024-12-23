error handling
errorIllegalContinuationByte: byte from: stream
	^ self error: 'Illegal continuation byte for utf-8 encoding'