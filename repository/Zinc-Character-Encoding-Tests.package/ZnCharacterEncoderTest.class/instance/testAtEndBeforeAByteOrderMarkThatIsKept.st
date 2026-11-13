testing
testAtEndBeforeAByteOrderMarkThatIsKept
	self byteOrderMarkEncoders do: [ :encoder | | bytes stream |
		encoder ignoreByteOrderMark: false.
		bytes := encoder encodeString: (self withByteOrderMarks: 'a<').
		stream := ZnCharacterReadStream on: bytes readStream encoding: encoder.
		self assert: stream next equals: $a.
		self deny: stream atEnd.
		self assert: stream next equals: (Character value: 16rFEFF).
		self assert: stream atEnd ]