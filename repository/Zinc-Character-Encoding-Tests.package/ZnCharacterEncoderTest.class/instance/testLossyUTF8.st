testing
testLossyUTF8
	| encoder replacement |
	encoder := ZnLossyUTF8Encoder new.
	self assert: #utf8lossy asZnCharacterEncoder equals: encoder.
	replacement := encoder replacementCodePoint asCharacter.
	self 
		assert: (#[65 160 66] decodeWith: encoder) 
		equals: ({ $A. replacement . $B } as: String).
	self 
		assert: (#[16rE1 16rA0 16rC0] decodeWith: encoder) 
		equals: replacement asString.
	self 
		assert: (encoder decodeBytes: #[16r41 16rA1 16rA2 16rA3 16r42]) 
		equals: ({ $A. replacement . replacement . replacement . $B } as: String).
	self 
		assert: (encoder decodeBytesSingleReplacement: #[16r41 16rA1 16rA2 16rA3 16r42])
		equals: ({ $A. replacement . $B } as: String).
	self
		assert: (encoder encodeString: ({ $A . 16rFFFD asCharacter . $B } as: String))
		equals: ({ $A . replacement . $B } as: String) utf8Encoded