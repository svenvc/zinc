private
readLimitedFrom: stream
	| readStream newString bufferSize index |
	self contentLength > ZnConstants maximumEntitySize 
		ifTrue: [ ZnEntityTooLarge signal ].
	readStream := ZnLimitedReadStream on: stream limit: self contentLength.
	self initializeEncoder.
	bufferSize := ZnUtils streamingBufferSize.
	index := 0.
	newString := String new: self contentLength streamContents: [ :stringStream |
		[ readStream atEnd ] whileFalse: [
			stringStream nextPut: (encoder nextFromStream: readStream).
			((index := index + 1) \\ bufferSize) = 0 
				ifTrue: [ ZnUtils signalProgress: index total: self contentLength ] ] ].
	self string: newString