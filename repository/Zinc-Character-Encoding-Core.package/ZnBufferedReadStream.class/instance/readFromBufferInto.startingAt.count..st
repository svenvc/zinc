private
readFromBufferInto: collection startingAt: offset count: requestedCount
	"Read up to requestedCount elements into collection starting at offset,
	from my buffer, answering the number of elements read.
	There could be fewer elements buffered."

	| read |
	read := 0.
	position <= limit
		ifTrue: [ read := limit - position + 1 min: requestedCount.
			collection
				replaceFrom: offset
				to: offset + read - 1
				with: buffer
				startingAt: position.
			position := position + read ].
	^ read