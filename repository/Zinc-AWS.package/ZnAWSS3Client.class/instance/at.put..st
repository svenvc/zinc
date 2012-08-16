operations
at: bucketKeyAssociation put: object
	"Set an AWS S3 object in a bucket to object,
	assumed to be ZnEntity compatible,
	identified by a bucket->key association"

	^ self at: bucketKeyAssociation put: object headers: nil