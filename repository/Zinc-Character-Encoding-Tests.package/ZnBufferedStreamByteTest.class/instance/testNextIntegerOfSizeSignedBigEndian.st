tests
testNextIntegerOfSizeSignedBigEndian
	self integerEncodingSpec do: [ :spec |
		| input integer |
		input := ByteArray readHexFrom: spec first.
		integer := (ZnBufferedReadStream on: input readStream)
			nextIntegerOfSize: input
			size signed: spec third = #s
			bigEndian: spec fourth = #be.
		self assert: integer equals: spec second ]