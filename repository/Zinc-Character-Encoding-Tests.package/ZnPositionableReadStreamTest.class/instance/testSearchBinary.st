tests
testSearchBinary
	| data stream pattern found |
	data := ByteArray new: 2000 streamContents: [ :out |
		2000 timesRepeat: [ out nextPut: 256 atRandom - 1 ] ].
	pattern := ByteArray readHexFrom: 'FF77ABAB'.
	data replaceFrom: 1000 to: 1000 + pattern size - 1 with: pattern.
	stream := ZnPositionableReadStream on: data readStream.
	found := false.
	[ stream atEnd ] whileFalse: [
		stream savingPositionDo: [
			(stream next: pattern size) = pattern
				ifTrue: [
					found := true.
					self assert: stream position equals: 1000 + pattern size - 1 ] ].
		stream next ].
	self assert: found