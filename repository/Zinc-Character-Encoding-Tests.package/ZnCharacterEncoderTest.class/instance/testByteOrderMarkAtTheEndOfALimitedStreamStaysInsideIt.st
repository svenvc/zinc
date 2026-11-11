testing
testByteOrderMarkAtTheEndOfALimitedStreamStaysInsideIt
	self byteOrderMarkEncoders do: [ :encoder | | value stream |
		value := encoder encodeString: (self withByteOrderMarks: 'a<').
		stream := (value , (encoder encodeString: 'X')) readStream.
		self
			assert: (ZnCharacterReadStream on: (ZnLimitedReadStream on: stream limit: value size) encoding: encoder) upToEnd
			equals: 'a'.
		self assert: stream position equals: value size.
		self assert: (encoder nextFromStream: stream) equals: $X ]