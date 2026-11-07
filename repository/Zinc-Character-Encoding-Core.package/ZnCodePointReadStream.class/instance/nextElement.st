private
nextElement
	"Answer nil for an ignored mark that ends the input, see ZnCharacterEncoder>>#isIgnoredCodePoint:"

	| codePoint |
	codePoint := self encoder nextCodePointFromStream: stream.
	^ (codePoint == 16rFEFF and: [ self encoder isIgnoredCodePoint: codePoint ]) ifFalse: [ codePoint ]