testing
testByteOrderMarksAloneAreAnEmptyText
	self byteOrderMarkEncoders do: [ :encoder |
		#( '<' '<<' ) do: [ :pattern | | bytes |
			bytes := encoder encodeString: (self withByteOrderMarks: pattern).
			self assert: (encoder decodeBytes: bytes) equals: ''.
			self assert: (ZnCharacterReadStream on: bytes readStream encoding: encoder) upToEnd equals: '' ] ]