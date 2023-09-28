accessing
skip: anInteger
	anInteger < 0 ifTrue: [ self error: 'cannot skip backwards' ].
	readStream skip: anInteger