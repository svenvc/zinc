testing
testDebuggingUTF8
	self 
		assert: (({ $A. 55296 asCharacter . $B } as: String) encodeWith: #utf8debug) utf8Decoded 
		equals: 'A<Cannot utf-8 encode code point 55296>B'