writing
writeOn: stream
	| bufferSize |
	self initializeEncoder.
	bufferSize := ZnUtils streamingBufferSize.
	self string doWithIndex: [ :each :index | 
		encoder nextPut: each toStream: stream.
		(index \\ bufferSize) = 0 
			ifTrue: [ ZnUtils signalProgress: index total: self contentLength ] ]