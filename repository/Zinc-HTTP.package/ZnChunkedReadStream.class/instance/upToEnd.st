accessing
upToEnd
	"We use out own collectionSpecies."

	^ self collectionSpecies streamContents: [ :out |
		[ self atEnd ] whileFalse: [ 
			out nextPut: self next ] ]