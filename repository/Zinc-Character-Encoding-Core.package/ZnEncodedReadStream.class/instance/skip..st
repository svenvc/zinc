accessing
skip: count
	count < 0 ifTrue: [ self error: 'cannot skip backwards' ].
	count timesRepeat: [ self next ]