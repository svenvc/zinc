accessing-query
queryAddAll: keyedCollection
	"Note that we use #addAllMulti:"

	keyedCollection isEmpty
		ifFalse: [ 
			query ifNil: [ query := ZnMultiValueDictionary new ].
			query addAllMulti: keyedCollection ].
	^ keyedCollection