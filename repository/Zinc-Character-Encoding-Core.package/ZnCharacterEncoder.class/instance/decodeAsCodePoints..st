convenience
decodeAsCodePoints: bytes
	"Decode bytes and return the resulting code points"

	| byteStream |
	byteStream := bytes readStream.
	^ Array streamContents: [ :stream | | codePoint |
		[ byteStream atEnd ] whileFalse: [
			codePoint := self nextCodePointFromStream: byteStream.
			stream nextPut: codePoint ].
		"An ignored mark is only answered at the end of the input, see #isIgnoredCodePoint:"
		(codePoint notNil and: [ self isIgnoredCodePoint: codePoint ])
			ifTrue: [ stream skip: -1 ] ]