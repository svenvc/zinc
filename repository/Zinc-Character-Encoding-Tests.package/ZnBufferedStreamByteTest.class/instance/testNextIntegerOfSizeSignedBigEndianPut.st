tests
testNextIntegerOfSizeSignedBigEndianPut
	self integerEncodingSpec do: [ :spec |
		| input output |
		input := ByteArray readHexFrom: spec first.
		output := ByteArray streamContents: [ :out |
			ZnBufferedWriteStream on: out do: [ :bout |
				bout
					nextIntegerOfSize: input size
					signed: spec third = #s
					bigEndian: spec fourth = #be
					put: spec second ] ].
		self assert: output equals: input ]