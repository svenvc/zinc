testing
isIgnoredCodePoint: codePoint
	"Return true when readers of whole inputs drop codePoint instead of answering it.
	See ZnUTFEncoder>>#isIgnoredCodePoint:"

	^ false