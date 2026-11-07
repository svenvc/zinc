testing
testConsecutiveByteOrderMarksAreSkipped
	self byteOrderMarkEncoders do: [ :encoder | | bytes |
		bytes := encoder encodeString: (self withByteOrderMarks: '<<a<<b<<').
		self assert: (encoder decodeBytes: bytes) equals: 'ab'.
		self assert: (ZnCharacterReadStream on: bytes readStream encoding: encoder) upToEnd equals: 'ab' ]