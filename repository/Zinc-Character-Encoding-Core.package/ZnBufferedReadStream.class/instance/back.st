accessing
back
	"Move backwards one element and return it"

	^ position > limit
		ifTrue: [
			stream back ]
		ifFalse: [ | char |
			position = 1 ifTrue: [ self error: 'Cannot move back from beginning' ].
			char := buffer at: position.
			position := position - 1.
			char ]