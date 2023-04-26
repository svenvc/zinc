encoding - decoding
ensureAtBeginOfCodePointOnStream: stream
	"Ensure that the current position of stream is a the beginning of an encoded code point,
	if not move further backwards. This is necessary when a position in the binary stream is set,
	not knowing if that position is on a proper encoded character boundary."

	| word |
	"Each code point is encoded using words of 2 bytes, move backwards until our position is divisible by 2"
	[ stream position \\ 2 = 0 ] whileFalse: [ stream back ].
	"Now read the next word and back up"
	word := self read16BitWordFromStream: stream.
	self back16BitWordOnStream: stream.
	"If it is a low or trailing surrogate, move another word backwards until the high or leading surrogate"
	(word between: 16rDC00 and: 16rDFFF)
		ifTrue: [
			self back16BitWordOnStream: stream ]