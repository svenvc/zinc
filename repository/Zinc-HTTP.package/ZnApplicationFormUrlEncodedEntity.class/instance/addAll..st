accessing
addAll: keyedCollection
	"Note that we use #addAllMulti:"

	self fields addAllMulti: keyedCollection.
	^ keyedCollection 