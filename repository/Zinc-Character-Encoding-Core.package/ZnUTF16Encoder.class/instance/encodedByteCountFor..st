converting
encodedByteCountFor: character
	"Return how many bytes are needed to encode character"

	| code |
	code := character codePoint.
	code <= 65535 ifTrue: [ ^ 2 ].
	code <= self maximumUTF16Code ifTrue: [ ^ 4 ].
	self errorOutsideRange