testing
testByteOrderMarkAtTheEndIsSkipped
	self byteOrderMarkEncoders do: [ :encoder | | bytes string |
		bytes := encoder encodeString: (self withByteOrderMarks: 'a<').
		self assert: (encoder decodeBytes: bytes) equals: 'a'.
		self assert: (encoder decodeBytesIntoWideString: bytes) equals: 'a'.
		self assert: (encoder decodeAsCodePoints: bytes) equals: #( 97 ).
		string := String new: 3.
		self assert: (encoder readInto: string startingAt: 1 count: 3 fromStream: bytes readStream) equals: 1.
		self assert: string first equals: $a.
		self assert: (ZnCharacterReadStream on: bytes readStream encoding: encoder) upToEnd equals: 'a'.
		self assert: ((ZnCharacterReadStream on: bytes readStream encoding: encoder) next: 3) equals: 'a'.
		self assert: ((ZnCharacterReadStream on: bytes readStream encoding: encoder) upTo: $z) equals: 'a'.
		self assert: (ZnCodePointReadStream on: bytes readStream encoding: encoder) upToEnd equals: #( 97 ) ]