encoding - decoding
forwardOnStream: stream
	"Move forward one character on stream"

	| firstUnit |
	"Read the first 16-bit code unit because character are on 2 or 4 bytes."
	firstUnit := self read16BitWordFromStream: stream.
	"If we have a surrogate code point, we need to read two more bytes."	
	(self isSurrogateCodePoint: firstUnit) ifFalse: [ ^ self ].
	stream next ifNil: [ self errorIncompleteFrom: stream ].
	stream next ifNil: [ self errorIncompleteFrom: stream ]