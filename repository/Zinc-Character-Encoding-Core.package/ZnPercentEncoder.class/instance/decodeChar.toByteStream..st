private
decodeChar: char toByteStream: byteStream
	char charCode < 128
		ifTrue: [ 
			byteStream nextPut: char charCode ]
		ifFalse: [
			self urlAsIri
				ifTrue: [ self characterEncoder nextPut: char toStream: byteStream ]
				ifFalse: [ self errorAsciiCharacterExpected ] ]