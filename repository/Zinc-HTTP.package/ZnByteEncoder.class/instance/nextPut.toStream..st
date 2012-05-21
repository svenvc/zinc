converting
nextPut: character toStream: stream
	| code |
	(code := character charCode) < 128
		ifTrue: [ stream nextPut: code ]
		ifFalse: [ | ch |
			"In the standard Squeak table the byte values were converted to characters"
			ch := unicodeToByte at: code ifAbsent: [ self error: 'Character code outside encoder range' ].
			stream nextPut: ch charCode ]