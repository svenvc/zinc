accessing
upToEnd
	"Read elements until the stream is atEnd and return them as a collection."

	| streamSize result remaining |
	"If the stream knows its size we can reduce overhead by allocating a buffer of the correct size.
	If the size is an over-estimate, #next: will copy the results in to a buffer of the correct size."
	streamSize := [ self size ] on: Error do: [ 0 ].
	result := streamSize > 0
		ifTrue: [ self next: (streamSize - self position) ]
		ifFalse: [ self collectionSpecies new ].
	"If the size is an under-estimate we're not at the end, get the rest and append to the result"
	^ self atEnd
		ifTrue: [ result ]
		ifFalse: [
			remaining := self collectionSpecies streamContents: [ :out |
				[ self atEnd ] whileFalse: [
					position > limit
						ifTrue: [ self nextBuffer ].
					out next: limit - position + 1 putAll: buffer startingAt: position.
					position := limit + 1 ] ].
			result := result , remaining ]