accessing
upToAll: aCollection
	"Answer a subcollection from the current access position to the occurrence (if any, but not inclusive) of aCollection. If aCollection is not in the stream, answer the entire rest of the stream."

	^ self collectionSpecies streamContents: [ :out | | pattern |
		pattern := aCollection readStream.
		([ self atEnd or: [ pattern atEnd ] ]) whileFalse: [
			self peek = pattern peek
				ifTrue: [
					self next. pattern next ]
				ifFalse: [
					pattern position = 0
						ifTrue: [ out nextPut: self next ]
						ifFalse: [ out next: pattern position putAll: aCollection ].
					pattern reset ] ].
		pattern atEnd
			ifFalse: [ out next: pattern position putAll: aCollection ] ]