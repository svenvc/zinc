tests
testReadAll
	| data stream |
	data := String new: 200 streamContents: [ :out |
		200 timesRepeat: [ out nextPut: 'abc' atRandom ] ].
	stream := ZnPositionableReadStream on: data readStream.
	self deny: stream atEnd.
	self assert: stream position isZero.
	stream savingPositionDo: [
		self assert: stream upToEnd equals: data.
		self assert: stream atEnd.
		self assert: stream position equals: 200 ].
	self deny: stream atEnd.
	self assert: stream position isZero.
	self assert: stream upToEnd equals: data.
	self assert: stream atEnd.
	self assert: stream position equals: 200