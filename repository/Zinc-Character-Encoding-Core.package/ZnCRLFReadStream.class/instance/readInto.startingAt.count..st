accessing
readInto: collection startingAt: offset count: requestedCount

	0 to: requestedCount - 1 do: [ :count | | byte |
		(byte := self next) ifNil: [ ^ count ].
		collection at: offset + count put: byte ].
	^ requestedCount