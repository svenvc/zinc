tests
testReadAllLargerBuffer
	| data stream |
	data := String new: 500 streamContents: [ :out |
		500 timesRepeat: [ out nextPut: 'abc' atRandom ] ].
	stream := ZnPositionableReadStream on: data readStream.
	stream sizeBuffer: 500.
	self deny: stream atEnd.
	self assert: stream position isZero.
	stream savingPositionDo: [
		self assert: stream upToEnd equals: data.
		self assert: stream atEnd.
		self assert: stream position equals: 500 ].
	self deny: stream atEnd.
	self assert: stream position isZero.
	self assert: stream upToEnd equals: data.
	self assert: stream atEnd.
	self assert: stream position equals: 500