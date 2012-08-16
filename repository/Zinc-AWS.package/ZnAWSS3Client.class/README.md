I am ZnAWSS3Client, a basic AWS S3 Client (http://en.wikipedia.org/wiki/Amazon_S3).

| client |
(client := ZnAWSS3Client new)
	accessKeyId: '2ZGSSBGBHQGJ9VV5N441';
	secretAccessKey: 'OtxrzxIsfpFjA7SwPzILwy8Bw21TLhquhboDYROV';
	checkIntegrity: true.
client buckets.
client keysIn: 'my-bucket'.
client keysIn: 'my-bucket' query: (Dictionary with: 'prefix'->'my-').
client at: 'my-bucket' -> 'my-key'.
client at: 'my-bucket' -> 'my-key' put: (ZnEntity with: '0123456789').
client at: 'my-bucket' -> 'my-key' put: (ZnEntity with: 'Smalltalk rules S3!') headers: (Dictionary with: 'x-amz-acl'->'public-read').
client remove: 'my-bucket' -> 'my-key'.
client removeBucket: 'my-bucket'.
client close.

I depend on Zinc HTTP Components and XML Support.