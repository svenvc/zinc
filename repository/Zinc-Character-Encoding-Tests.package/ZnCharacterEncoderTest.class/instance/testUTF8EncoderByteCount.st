testing
testUTF8EncoderByteCount

	| encoder |
	encoder := ZnUTF8Encoder new.
	self assert: (encoder encodedByteCountFor: $$) equals: 1.
	self assert: (encoder encodedByteCountFor: 16r00A2 asCharacter) equals: 2.
	self assert: (encoder encodedByteCountFor: 16r20AC asCharacter) equals: 3.
	self assert: (encoder encodedByteCountFor: 16r024B62 asCharacter) equals: 4