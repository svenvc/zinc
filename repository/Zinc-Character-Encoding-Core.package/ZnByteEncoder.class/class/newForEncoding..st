instance creation
newForEncoding: string
	"Return a new character encoder object for an encoding described by string.
	We use our precomputed ByteTextConverters tables."

	| tables |
	tables := ByteTextConverters at: string.
	^ self new
		identifier: string;
		byteToUnicode: tables first;
		unicodeToByte: tables second;
		yourself