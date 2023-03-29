encoding - decoding
skipToBeginOfCodePointOnStream: stream
	"Ensure that the current position of stream is a the beginning of an encoded code point,
	if not move further forward. This is necessary when a position in the binary stream is set,
	not knowing if that position is on a proper encoded character boundary."

	| word |
	"Each code point is encoded using words of 2 bytes, move forward until our position is divisible by 2"
	[ stream position \\ 2 = 0 ] whileFalse: [ stream next ].
	"Now read the next word and back up"
	word := self read16BitWordFromStream: stream.
	self back16BitWordOnStream: stream.
	"If it is a low or trailing surrogate, move another word forward until the high or leading surrogate"
	(word between: 16rDC00 and: 16rDFFF)
		ifTrue: [
			self read16BitWordFromStream: stream ]