operations
at: bucketKeyAssociation put: object headers: headers
	"Set an AWS S3 object in a bucket to object,
	assumed to be ZnEntity compatible,
	identified by a bucket->key association
	adding headers to the request"
	
	self endPoint: (self endPointForBucket: bucketKeyAssociation key).
	self httpClient url: bucketKeyAssociation value.
	self httpClient entity: object.
	headers notNil 
		ifTrue: [ self httpClient headerAddAll: headers ].
	^ self executeRequest: #put