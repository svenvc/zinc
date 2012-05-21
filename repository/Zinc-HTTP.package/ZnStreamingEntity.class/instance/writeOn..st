writing
writeOn: outputStream
	ZnUtils 
		streamFrom: self stream 
		to: outputStream 
		size: self contentLength.
	stream close