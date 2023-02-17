accessing
upToEnd
	"Read elements until the stream is atEnd and return them as a collection."

	^ self collectionSpecies
		streamContents: [ :collectionStream |
			[ self atEnd ] whileFalse: [ collectionStream nextPut: self next ] ]