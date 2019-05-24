testing
testSimple
	| encoder |
	encoder := self encoderClass new.
	self 
		assert: (encoder encode: 'Man' asByteArray)
		equals: 'TWFu'.
	self
		assert: (encoder decode: 'TWFu')
		equals: 'Man' asByteArray 