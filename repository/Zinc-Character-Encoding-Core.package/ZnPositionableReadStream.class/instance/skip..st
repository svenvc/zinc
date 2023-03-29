accessing
skip: integer
	"Skip over integer count elements."

	integer > 0
		ifTrue: [ integer timesRepeat: [ self next ] ]
		ifFalse: [ self position: (self position + integer) ]