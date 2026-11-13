accessing
position
	"Answer the byte position in the wrapped stream, before a peeked element that is not read yet"

	^ super position - (peeked ifNil: [ 0 ] ifNotNil: [ self encoder encodedByteCountForCodePoint: peeked asInteger ])