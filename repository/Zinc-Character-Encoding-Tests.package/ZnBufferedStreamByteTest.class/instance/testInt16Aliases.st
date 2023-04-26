tests
testInt16Aliases
	| input writer |
	writer := [ :block |
		ByteArray streamContents: [ :out |
			ZnBufferedWriteStream on: out do: block ] ].
	input := ByteArray readHexFrom: '04D2'.
	self assert: (ZnBufferedReadStream on: input readStream) int16 equals: 1234.
	self assert: (ZnBufferedReadStream on: input readStream) uint16 equals: 1234.
	self assert: (ZnBufferedReadStream on: input readStream) nextWord equals: 1234.
	self assert: ((ZnBufferedReadStream on: input readStream) nextNumber: 2) equals: 1234.
	self assert: ((ZnBufferedReadStream on: input reversed readStream) nextLittleEndianNumber: 2) equals: 1234.
	self assert: (writer value: [ :out | out int16: 1234 ]) equals: input.
	self assert: (writer value: [ :out | out uint16: 1234 ]) equals: input.
	self assert: (writer value: [ :out | out nextWordPut: 1234 ]) equals: input.
	self assert: (writer value: [ :out | out nextNumber: 2 put: 1234 ]) equals: input.
	self assert: (writer value: [ :out | out nextLittleEndianNumber: 2 put: 1234 ]) equals: input reversed.
	input := ByteArray readHexFrom: 'FB2E'.
	self assert: (ZnBufferedReadStream on: input readStream) int16 equals: -1234.
	self assert: (writer value: [ :out | out int16: -1234 ]) equals: input