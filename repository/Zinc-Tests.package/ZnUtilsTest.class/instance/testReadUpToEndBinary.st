testing
testReadUpToEndBinary
	| data |
	data := ByteArray streamContents: [ :stream | 1 to: 10000 do: [ :each | stream nextPut: #(1 2 3) atRandom ] ].
	self assert: (ZnUtils readUpToEnd: data readStream limit: nil) equals: data.
	self assert: (ZnUtils readUpToEnd: data readStream limit: 10000) equals: data.
	self should: [ ZnUtils readUpToEnd: data readStream limit: 9999 ] raise: ZnEntityTooLarge