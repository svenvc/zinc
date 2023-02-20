accessing
position
	"Return the byte position in the underlying/wrapped binary stream, zero based.
	This is not a character based position! But it is always at the beginning of a code point."

	^ stream position