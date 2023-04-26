tests
testSearch
	| data stream found |
	data := String new: 2000 streamContents: [ :out |
		2000 timesRepeat: [ out nextPut: 'abc' atRandom ] ].
	data replaceFrom: 1000 to: 1005 with: 'TARGET'.
	stream := ZnPositionableReadStream on: data readStream.
	found := false.
	[ stream atEnd ] whileFalse: [
		stream savingPositionDo: [
			(stream next: 6) = 'TARGET'
				ifTrue: [
					found := true.
					self assert: stream position equals: 1005 ] ].
		stream next ].
	self assert: found