accessing
collectionSpecies
	"Return the collection class able to hold my elements"

	^ (stream respondsTo: #collectionSpecies)
		ifTrue: [ stream collectionSpecies ]
		ifFalse: [ stream isBinary
				ifTrue: [ ByteArray ]
				ifFalse: [ String ] ]