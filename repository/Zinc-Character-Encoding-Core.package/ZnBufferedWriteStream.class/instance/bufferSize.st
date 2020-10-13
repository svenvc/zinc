accessing
bufferSize

	^ buffer ifNil: [ self defaultBufferSize ] ifNotNil: [ buffer size ]