accessing
scheme: anObject

	anObject ifNil: [ scheme := nil ] ifNotNil: [ scheme := anObject asLowercase asSymbol ]