convenience
decodeBytesIntoWideString: bytes
	"Variant of #decodeBytes: that is faster when you know upfront that a WideString is probably needed"

	| byteStream |
	byteStream := bytes readStream.
	^ WideString streamContents: [ :stream | | codePoint |
		[ byteStream atEnd ] whileFalse: [
			codePoint := self nextCodePointFromStream: byteStream.
			stream nextPut: (Character value: codePoint) ].
		"An ignored mark is only answered at the end of the input, see #isIgnoredCodePoint:"
		(codePoint notNil and: [ self isIgnoredCodePoint: codePoint ])
			ifTrue: [ stream skip: -1 ] ]