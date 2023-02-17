positioning
position: newPosition
	"Move my current position to newPosition, an object obtained by previously calling #position. My buffer size limits how far I can be positioned backwards. A SubscriptOutOfBounds exception will be signalled in case this operation cannot be completed. It is also no possible to go backwards unless data has been read previously."

	| newDelta |
	newDelta := count - newPosition.
	(newDelta between: 0 and: (buffer size min: count))
		ifFalse: [
			^ SubscriptOutOfBounds
					signalFor: self
					lowerBound: self position
					upperBound: self position - (buffer size min: count) ].
	^ delta := newDelta