accessing
asResource
	^ String streamContents: [ :stream |
		stream 
			nextPut: $/; 
			nextPutAll: bucketKeyAssociation key; 
			nextPut: $/; 
			nextPutAll: bucketKeyAssociation value ]