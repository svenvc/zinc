accessing
upToEnd
	"#next answers nil for an element dropped at the end, see #nextElement"

	^ self collectionSpecies
		streamContents: [ :collectionStream |
			[ self atEnd ] whileFalse: [
				self next ifNotNil: [ :element | collectionStream nextPut: element ] ] ]