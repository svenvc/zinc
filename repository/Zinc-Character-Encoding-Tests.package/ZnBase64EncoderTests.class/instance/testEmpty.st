testing
testEmpty
	| encoder |
	encoder := ZnBase64Encoder new.
	self 
		assert: (encoder encode: #[] asByteArray)
		equals: ''.
	self
		assert: (encoder decode: '')
		equals: #[] asByteArray