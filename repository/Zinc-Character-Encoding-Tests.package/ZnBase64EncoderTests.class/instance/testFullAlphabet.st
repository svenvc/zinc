testing
testFullAlphabet
	| encoder input output |
	encoder := self encoderClass new.
	input := encoder alphabet.
	output := encoder decode: input.
	self assert: (encoder encode: output) equals: input.
	encoder breakLines.
	output := encoder decode: input.
	self assert: (encoder encode: output) equals: input