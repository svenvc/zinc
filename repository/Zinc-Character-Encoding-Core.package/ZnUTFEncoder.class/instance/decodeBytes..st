convenience
decodeBytes: bytes
	"Overridden to prevent the automagic switch from ByteString to WideString
	and the slow #becomeForward: in there. See also #decodeBytesIntoWideString:"

	| byteStream |
	byteStream := bytes readStream.
	^ String streamContents: [ :stream | | codePoint |
		[ byteStream atEnd ] whileFalse: [
			codePoint := self nextCodePointFromStream: byteStream.
			(codePoint > 255 and: [ stream originalContents isWideString not ])
				ifTrue: [ | wideString position |
					"Do not widen the buffer just to discard a trailing ignored mark."
					(self isIgnoredCodePoint: codePoint) ifTrue: [ ^ stream contents ].
					position := stream position.
					wideString := WideString from: stream originalContents.
					stream on: wideString; setFrom: position + 1 to: position ].
			stream nextPut: (Character value: codePoint) ].
		"An ignored mark is only answered at the end of the input, see #isIgnoredCodePoint:"
		(codePoint notNil and: [ self isIgnoredCodePoint: codePoint ])
			ifTrue: [ stream skip: -1 ] ]