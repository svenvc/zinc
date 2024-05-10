testing
testUTF8ByteOrderMarkSignificant
	| input encoder result |
	input := #[16r41 16rEF 16rBB 16rBF 16r42].
	encoder := ZnUTF8Encoder new.
	encoder ignoreByteOrderMark: false.
	result := encoder decodeBytes: input.
	self assert: result first equals: $A.
	self assert: result second equals: encoder byteOrderMark asCharacter.
	self assert: result third equals: $B