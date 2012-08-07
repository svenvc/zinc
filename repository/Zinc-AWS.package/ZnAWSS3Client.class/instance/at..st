operations
at: bucketKeyAssociation
	"Access an AWS S3 object in a bucket,
	identified by a bucket->key association"
	
	self endPoint: (self endPointForBucket: bucketKeyAssociation key).
	self httpClient url: bucketKeyAssociation value.
	^ self executeRequest: #get