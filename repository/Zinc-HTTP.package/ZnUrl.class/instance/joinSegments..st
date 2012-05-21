private
joinSegments: collection
	^ String streamContents: [ :stream |
		collection 
			do: [ :each | stream nextPutAll: each ]
			separatedBy: [ stream nextPut: $/ ] ]