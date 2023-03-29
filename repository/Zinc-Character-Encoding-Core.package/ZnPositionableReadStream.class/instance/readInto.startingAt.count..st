accessing
readInto: collection startingAt: offset count: requestedCount
	"Read requestedCount elements into collection starting at offset,
	returning the number of elements read, there could be less elements available."

	0 to: requestedCount - 1 do: [ :aCount | | object |
		(object := self next) ifNil: [ ^ aCount ].
		collection at: offset + aCount put: object ].
	^ requestedCount