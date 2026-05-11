writing
next: writeCount putAll: collection
	"Write count elements from collection"

	self
		next: writeCount
		putAll: collection
		startingAt: 1