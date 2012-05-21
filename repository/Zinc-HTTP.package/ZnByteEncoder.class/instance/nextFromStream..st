converting
nextFromStream: stream
	| byteValue |
	^ (byteValue := stream next) < 128
		ifTrue: [ Character codePoint: byteValue ]
		ifFalse: [ | ch |
			"In the standard Squeak table some strange leading char was added"
			ch := byteToUnicode at: byteValue - 127.
			ch asUnicodeChar ]