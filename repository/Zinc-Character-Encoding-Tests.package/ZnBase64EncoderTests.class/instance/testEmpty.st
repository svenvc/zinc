testing
testEmpty
	| encoder |
	encoder := self encoderClass new.
	self 
		assert: (encoder encode: #[])
		equals: ''.
	self
		assert: (encoder decode: '')
		equals: #[]