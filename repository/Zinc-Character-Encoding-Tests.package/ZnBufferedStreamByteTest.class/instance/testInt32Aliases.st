tests
testInt32Aliases
	| input writer |
	writer := [ :block |
		ByteArray streamContents: [ :out |
			ZnBufferedWriteStream on: out do: block ] ].
	input := ByteArray readHexFrom: '499602D2'.
	self assert: (ZnBufferedReadStream on: input readStream) int32 equals: 1234567890.
	self assert: (ZnBufferedReadStream on: input readStream) uint32 equals: 1234567890.
	self assert: (ZnBufferedReadStream on: input readStream) nextInt32 equals: 1234567890.
	self assert: ((ZnBufferedReadStream on: input readStream) nextNumber: 4) equals: 1234567890.
	self assert: ((ZnBufferedReadStream on: input reversed readStream) nextLittleEndianNumber: 4) equals: 1234567890.
	self assert: (writer value: [ :out | out int32: 1234567890 ]) equals: input.
	self assert: (writer value: [ :out | out uint32: 1234567890 ]) equals: input.
	self assert: (writer value: [ :out | out nextInt32Put: 1234567890 ]) equals: input.
	self assert: (writer value: [ :out | out nextNumber: 4 put: 1234567890 ]) equals: input.
	self assert: (writer value: [ :out | out nextLittleEndianNumber: 4 put: 1234567890 ]) equals: input reversed.
	input := ByteArray readHexFrom: 'B669FD2E'.
	self assert: (ZnBufferedReadStream on: input readStream) int32 equals: -1234567890.
	self assert: (ZnBufferedReadStream on: input readStream) nextInt32 equals: -1234567890.
	self assert: (writer value: [ :out | out int32: -1234567890 ]) equals: input.
	self assert: (writer value: [ :out | out nextInt32Put: -1234567890 ]) equals: input