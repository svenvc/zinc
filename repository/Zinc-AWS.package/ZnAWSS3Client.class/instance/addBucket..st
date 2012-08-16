operations
addBucket: bucket
	"Create a new AWS S3 bucket"

	self endPoint: self standardEndPoint.
	self httpClient url: bucket.
	^ self executeRequest: #put
