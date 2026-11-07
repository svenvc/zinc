accessing
upTo: anObject
	"#next answers nil for an element dropped at the end, see #nextElement"

	^ self collectionSpecies
		streamContents: [ :out | | element |
			[ self atEnd or: [ (element := self next) = anObject ] ] whileFalse: [
				element ifNotNil: [ out nextPut: element ] ] ]