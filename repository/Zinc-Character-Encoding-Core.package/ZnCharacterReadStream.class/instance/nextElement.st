private
nextElement
	"Answer nil for an ignored mark that ends the input, see ZnCharacterEncoder>>#isIgnoredCodePoint:"

	| character |
	character := self encoder nextFromStream: stream.
	^ (character asInteger == 16rFEFF and: [ self encoder isIgnoredCodePoint: 16rFEFF ])
		ifFalse: [ character ]