accessing
upToEnd
	"Overridden to read from the encoder directly, without #next and #nextElement for each character.
	An ignored mark is only answered at the end of the input, see ZnCharacterEncoder>>#isIgnoredCodePoint:.
	It is not written, so a ByteString is not widened for it."

	^ self collectionSpecies streamContents: [ :out | | encoder character |
		peeked ifNotNil: [
			out nextPut: peeked.
			peeked := nil ].
		encoder := self encoder.
		[ stream atEnd ] whileFalse: [
			character := encoder nextFromStream: stream.
			(character asInteger == 16rFEFF and: [ encoder isIgnoredCodePoint: 16rFEFF ])
				ifFalse: [ out nextPut: character ] ] ]