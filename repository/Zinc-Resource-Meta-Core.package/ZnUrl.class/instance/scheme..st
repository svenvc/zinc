accessing
scheme: anObject
	anObject isNil
		ifTrue: [ scheme := nil ]
		ifFalse: [ scheme := anObject asSymbol ]