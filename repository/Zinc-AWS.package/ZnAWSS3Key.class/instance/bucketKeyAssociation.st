accessing
bucketKeyAssociation
	bucketKeyAssociation isNil ifTrue: [ 
		bucketKeyAssociation := bucket -> key ].
	^ bucketKeyAssociation