accessing
ignoreByteOrderMark: boolean
	"When boolean is true I ignore Unicode byte-order mark (BOM) occurences that I read (the default).

	A mark is skipped by reading the character after it, see #isIgnoredCodePoint:. So a single
	#nextFromStream: on a stream that holds more than the text to decode can read past the end of
	that text. To read part of a stream, wrap it in a ZnLimitedReadStream, or set boolean to false
	and handle the mark in the caller."

	ignoreByteOrderMark := boolean