as yet unclassified
upTo: aCharacterOrByte
	"Answer a subcollection from the current access position to the occurrence (if any, but not inclusive) of anObject in the receiver. If  anObject is not in the collection, answer the entire rest of the receiver."

	"Note: The 100k limit below is compatible with the previous version though arguably incorrect. If you need unbounded behavior either up the argument or provide nil in which case we'll read until we get it or run out of memory"

	^self upTo: aCharacterOrByte limit: 100000