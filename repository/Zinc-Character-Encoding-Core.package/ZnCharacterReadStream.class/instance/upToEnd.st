accessing
upToEnd
	"Overridden to read from the encoder directly, without #next and #nextElement for each character.
	An ignored mark is only answered at the end of the input, see ZnCharacterEncoder>>#isIgnoredCodePoint:.
	It is not written, so a ByteString is not widened for it."

	^ self collectionSpecies streamContents: [ :out | | characterEncoder character |
		peeked ifNotNil: [
			out nextPut: peeked.
			peeked := nil ].
		characterEncoder := self encoder.
		[ stream atEnd ] whileFalse: [
			character := characterEncoder nextFromStream: stream.
			(character asInteger == 16rFEFF and: [ characterEncoder isIgnoredCodePoint: 16rFEFF ])
				ifFalse: [ out nextPut: character ] ] ]