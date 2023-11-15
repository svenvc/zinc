private
ensureChunkBufferOfSize: size
	(chunk isNotNil and: [ size <= chunk size ]) ifTrue: [ ^ self ].
	chunk := self collectionSpecies new: size