testing
atEnd
	"Decode one element ahead when bytes remain: an ignored byte order mark that ends the input reads as nothing,
	see ZnCharacterEncoder>>#isIgnoredCodePoint:. So #next answers an element whenever I am not at the end.
	Written out instead of sending #peek, to keep the [ atEnd ] whileFalse: [ next ] loop as fast as without the look-ahead."

	peeked ifNotNil: [ ^ false ].
	stream atEnd ifTrue: [ ^ true ].
	^ (peeked := self nextElement) isNil