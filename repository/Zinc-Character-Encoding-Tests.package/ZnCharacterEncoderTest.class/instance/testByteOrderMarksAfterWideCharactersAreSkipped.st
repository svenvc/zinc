testing
testByteOrderMarksAfterWideCharactersAreSkipped
	self byteOrderMarkEncoders do: [ :encoder | | text bytes |
		text := String with: (Character value: 16r20AC) with: (Character value: 16r1F600).
		bytes := encoder encodeString: text , (self withByteOrderMarks: '<<').
		self assert: (encoder decodeBytes: bytes) equals: text.
		self assert: (encoder decodeBytesIntoWideString: bytes) equals: text.
		self assert: (encoder decodeAsCodePoints: bytes) equals: #(16r20AC 16r1F600).
		self assert: (ZnCharacterReadStream on: bytes readStream encoding: encoder) upToEnd equals: text ]