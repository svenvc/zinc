testing
testFullSpectrum
	| encoder input output |
	encoder := self encoderClass new.
	input := (0 to: 255) asByteArray , (255 to: 0) asByteArray.
	output := encoder encode: input.
	self assert: (encoder decode: output) equals: input.
	encoder breakLines.
	output := encoder encode: input.
	self assert: (encoder decode: output) equals: input.
