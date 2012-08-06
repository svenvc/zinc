operations
metaAt: bucketKeyAssociation
	"Access the meta information of an AWS S3 object in a bucket,
	identified by a bucket->key association, by doing a HEAD."
	
	self endPoint: (self endPointForBucket: bucketKeyAssociation key).
	self httpClient url: bucketKeyAssociation value.
	^ self executeRequest: #head