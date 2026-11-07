testing
testManyConsecutiveByteOrderMarksAreSkipped
	self byteOrderMarkEncoders do: [ :encoder | | marks |
		marks := String new: 4096 withAll: (Character value: 16rFEFF).
		{ marks. marks , 'a'. 'a' , marks. marks , 'a' , marks } do: [ :text | | bytes expected stream |
			bytes := encoder encodeString: text.
			expected := text copyWithout: (Character value: 16rFEFF).
			self assert: (encoder decodeBytes: bytes) equals: expected.
			self assert: (ZnCharacterReadStream on: bytes readStream encoding: encoder) upToEnd equals: expected.
			stream := (encoder encodeString: marks) readStream.
			self assert: (encoder nextFromStream: stream) equals: (Character value: 16rFEFF).
			self assert: stream atEnd ] ]