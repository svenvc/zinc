private
prefix: orderedCollection
	"Set my prefix to orderedCollection, interpreted as path elements.
	I will only handle requests that match."
	
	orderedCollection isEmpty
		ifFalse: [ prefix := orderedCollection ]