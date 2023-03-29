accessing
collectionSpecies
	"Delegate to our wrapped stream if possible."

	^ (stream respondsTo: #collectionSpecies)
			ifTrue: [ stream collectionSpecies ]
			ifFalse: [ stream isBinary ifTrue: [ ByteArray ] ifFalse: [ ByteString ] ]