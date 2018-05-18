accessing
readInto: collection startingAt: offset count: requestedCount
	"Read requestedCount elements into collection starting at offset,
	answering the number of elements read, there could be fewer elements available."

	| countRead countYetToRead |
	"First, read from elements already in my buffer."
	countRead := self readFromBufferInto: collection startingAt: offset count: requestedCount.
	countYetToRead := requestedCount - countRead.
	countYetToRead > 0
		ifTrue: [ "See if there are more elements to be read from the underlying stream"
			| newOffset |
			newOffset := offset + countRead.
			(self shouldBufferReadOfCount: countYetToRead)
				ifTrue: [ self nextBuffer.
					limit > 0
						ifTrue:
							[ countRead := countRead + (self readInto: collection startingAt: newOffset count: countYetToRead) ] ]
				ifFalse:
					[ countRead := countRead + (stream readInto: collection startingAt: newOffset count: countYetToRead) ] ].
	^ countRead