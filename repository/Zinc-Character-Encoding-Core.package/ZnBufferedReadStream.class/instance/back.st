accessing
back
	"Move backwards one element and return it"

	^ position > limit
		ifTrue: [
			stream back ]
		ifFalse: [ | targetPosition bufferPosition char |
			position = 1 ifTrue: 
				[ stream position = 0 ifTrue:
					[ self error: 'Cannot move back from beginning' ]
				ifFalse:
					[ targetPosition := self position - 1.
					"Assume that the caller may want to go back a few elements before reading forward again"
					bufferPosition := targetPosition - 10 max: 0.
					self position: bufferPosition.
					self nextBuffer.
					self position: targetPosition.
					self peek ] ]
			ifFalse:
				[ char := buffer at: position.
				position := position - 1.
				char ] ]