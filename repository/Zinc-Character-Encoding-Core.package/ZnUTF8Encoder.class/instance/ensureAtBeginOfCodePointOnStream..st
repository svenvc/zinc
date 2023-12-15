encoding - decoding
ensureAtBeginOfCodePointOnStream: stream
	"Ensure that the current position of stream is a the beginning of an encoded code point,
	if not move further backwards. This is necessary when a position in the binary stream is set,
	not knowing if that position is on a proper encoded character boundary."

	"If we are at end-of-stream, we can't be in the middle of an encoded codepoint
	(unless that codepoint is incomplete and thus invalid, which we won't worry about)"
	stream atEnd ifTrue: [ ^ self ].
	"Back up until we are not longer on a continuation byte but on a leading byte"
	[ (stream peek bitAnd: 2r11000000) == 2r10000000 ] whileTrue: [ stream back ]