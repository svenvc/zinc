operations
removeBucket: bucket
	"Remove an AWS S3 bucket"
	
	self endPoint: self standardEndPoint.
	self httpClient url: bucket.
	^ self executeRequest: #delete
