encoding - decoding
nextCodePointFromStream: stream
	"Read and return the next integer code point from stream"

	| codePoint |
	codePoint := self readCodePointFrom: stream.
	((self processByteOrderMark: codePoint) and: [ self ignoreByteOrderMark ])
		ifTrue: [ codePoint := self readCodePointFrom: stream ].
	((self isSurrogateCodePoint: codePoint) or: [ codePoint > self maximumUTFCode ])
		ifTrue: [ ^ self errorOutsideRange: codePoint from: stream ].
	^ codePoint