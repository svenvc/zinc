testing
atEnd
	"Answer whether I can access any more objects."

	^ delta = 0 and: [ stream atEnd ]