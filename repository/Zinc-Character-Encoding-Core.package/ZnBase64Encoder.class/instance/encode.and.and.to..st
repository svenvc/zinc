private
encode: byte1 and: byte2 and: byte3 to: stream
	stream
		nextPut: (alphabet at: (byte1 >> 2) + 1);
		nextPut: (alphabet at: ((byte1 bitAnd: 2r11) << 4 bitXor: (byte2 ifNil: [ 0 ]) >> 4) + 1).
	byte2
		ifNil: [ stream nextPutAll: '==' ]
		ifNotNil: [ 
			stream nextPut: (alphabet at: ((byte2 bitAnd: 2r1111) << 2 bitXor: (byte3 ifNil: [ 0 ]) >> 6) + 1).
			byte3
				ifNil: [ stream nextPut: $= ]
				ifNotNil: [ stream nextPut: (alphabet at: (byte3 bitAnd: 2r111111) + 1) ] ]