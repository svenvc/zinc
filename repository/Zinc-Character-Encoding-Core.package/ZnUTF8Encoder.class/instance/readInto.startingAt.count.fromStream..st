convenience
readInto: string startingAt: offset count: requestedCount fromStream: stream
	"Read requestedCount characters into string starting at offset,
	returning the number read, there could be less available when stream is atEnd.
	I signal a ZnByteStringBecameWideString notification if necessary.
	An ignored mark is only answered at the end of stream, see #isIgnoredCodePoint:"

	| stringBuffer |
	stringBuffer := string.
	offset to: offset + requestedCount - 1 do: [ :index | | codePoint |
		stream atEnd ifTrue: [ ^ index - offset ].
		codePoint := self nextCodePointFromStream: stream.
		(codePoint == 16rFEFF and: [ self isIgnoredCodePoint: codePoint ]) ifTrue: [ ^ index - offset ].
		(codePoint > 255 and: [ stringBuffer isWideString not ])
			ifTrue: [ stringBuffer := ZnByteStringBecameWideString convert: stringBuffer ].
		stringBuffer at: index put: (Character value: codePoint) ].
	^ requestedCount