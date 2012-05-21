accessing
readInto: collection startingAt: offset count: requestedCount
	"Read requestedCount elements into collection starting at offset.
	Return the actual number of elements read."

	| read |
	read := 0.
	[ read < requestedCount and: [ self atEnd not] ] whileTrue: [
		self ensureChunkOrAtEnd.
		collection replaceFrom: read + 1 to: read + limit with: chunk startingAt: 1.
		read := read + limit.
		position := position + limit ].
	^ read