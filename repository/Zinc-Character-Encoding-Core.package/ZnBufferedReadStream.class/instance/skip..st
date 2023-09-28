accessing
skip: count
	"Skip over count elements.
	This could be further optimzed."

	count < 0 ifTrue: [ self error: 'cannot skip backwards' ].
	count timesRepeat: [ self next ]