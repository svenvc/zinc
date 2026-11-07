testing
testIgnoredByteOrderMarkDoesNotWidenDecodedString
	self byteOrderMarkEncoders do: [ :encoder |
		{ ''. 'a'. String with: (Character value: 255). String new: 100000 withAll: $a } do: [ :text | | bytes decoded |
			bytes := encoder encodeString: text , (String with: (Character value: 16rFEFF)).
			decoded := encoder decodeBytes: bytes.
			self assert: decoded equals: text.
			self assert: decoded isByteString.
			decoded := (ZnCharacterReadStream on: bytes readStream encoding: encoder) upToEnd.
			self assert: decoded equals: text.
			self assert: decoded isByteString ] ]