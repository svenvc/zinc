converting
nextPut: character toStream: stream
	"Write the encoding for character to stream"

	| code leadSurrogate trailSurrogate |
	code := character codePoint.
	code <= 65535
		ifTrue: [ 
			^ self write16BitWord: code toStream: stream ].
	code <= self maximumUTF16Code
		ifTrue: [
			code := code - 16r10000.
			leadSurrogate := 16rD800 + (code // 16r400).
			trailSurrogate := 16rDC00 + (code \\ 16r400).
			self write16BitWord: leadSurrogate toStream: stream.
			self write16BitWord: trailSurrogate toStream: stream ]
		ifFalse: [
			self errorOutsideRange ]