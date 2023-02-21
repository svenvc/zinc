tests
testNew
	| stream |
	stream := ZnPositionableReadStream on: 'abc' readStream.
	self assert: stream position isZero.
	self assert: stream bufferSize equals: stream defaultBufferSize.
	self deny: stream atEnd