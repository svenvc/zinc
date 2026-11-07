encoding - decoding
nextCodePointFromStream: stream
	"Read and return the next integer code point from stream"

	| codePoint |
	codePoint := self readCodePointFrom: stream.
	"An ignored mark at the end of the input is answered, see #isIgnoredCodePoint:"
	[ (self processByteOrderMark: codePoint) and: [ self ignoreByteOrderMark ] ] whileTrue: [
		stream atEnd ifTrue: [ ^ self byteOrderMark ].
		codePoint := self readCodePointFrom: stream ].
	((self isSurrogateCodePoint: codePoint) or: [ codePoint > self maximumUTFCode ])
		ifTrue: [ ^ self errorOutsideRange: codePoint from: stream ].
	^ codePoint