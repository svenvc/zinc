testing
isIgnoredCodePoint: codePoint
	"Return true when codePoint is a byte order mark that I ignore. #nextCodePointFromStream: skips
	such a mark when more input follows and answers it at the end of the input. Readers of whole
	inputs then drop it, so a mark is ignored wherever it is."

	^ codePoint = self byteOrderMark and: [ self ignoreByteOrderMark ]