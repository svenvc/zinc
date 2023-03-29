testing
testByteWriting
	| string |
	string := String
		streamContents: [ :stream |
			| writeStream |
			writeStream := ZnBivalentWriteStream on: stream.
			writeStream
				nextPut: 97;
				nextPutAll: #(98 99) asByteArray ].
	self assert: string asByteArray equals: #(97 98 99) asByteArray