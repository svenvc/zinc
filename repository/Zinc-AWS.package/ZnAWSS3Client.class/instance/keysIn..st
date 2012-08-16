operations
keysIn: bucket
	"Return a collection of ZnAWSS3Key objects describing the keys in bucket"
	
	^ self keysIn: bucket query: nil