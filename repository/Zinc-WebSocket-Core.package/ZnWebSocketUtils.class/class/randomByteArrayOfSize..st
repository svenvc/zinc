accessing
randomByteArrayOfSize: size
	^ ByteArray new: size streamContents: [ :stream |
		size timesRepeat: [ 
			stream nextPut: 256 atRandom - 1 ] ].
