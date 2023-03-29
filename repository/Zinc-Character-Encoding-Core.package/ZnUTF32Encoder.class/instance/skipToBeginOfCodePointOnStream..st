encoding - decoding
skipToBeginOfCodePointOnStream: stream
	"Ensure that the current position of stream is a the beginning of an encoded code point,
	if not move further forward. This is necessary when a position in the binary stream is set,
	not knowing if that position is on a proper encoded character boundary."

	"Each code point is encoded using exaxtly 4 bytes, move forward until our position is divisible by 4"

	[ stream position \\ 4 = 0 ] whileFalse: [ stream next ]