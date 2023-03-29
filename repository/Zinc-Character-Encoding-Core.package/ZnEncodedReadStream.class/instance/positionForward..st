accessing
positionForward: aPosition
	"Set the byte position in the underlying/wrapped binary stream to aPosition.
	This is not a character based position! Positions are zero based.
	I will move further forward if aPosition is not at the beginning of a code point."

	super position: aPosition.
	self encoder skipToBeginOfCodePointOnStream: stream.
	peeked := nil