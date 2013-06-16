writing
writeOn: stream
	self contentLength > ZnUtils streamingBufferSize 
		ifTrue: [
			ZnUtils streamFrom: self readStream to: stream size: self contentLength ]
		ifFalse: [
			stream nextPutAll: self bytes ]