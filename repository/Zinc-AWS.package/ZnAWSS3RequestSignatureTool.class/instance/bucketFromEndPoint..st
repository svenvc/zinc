private
bucketFromEndPoint: host
	"For foo.s3.amazonaws.com return /foo
	For s3.amazonaws.com return the empty string"
	
	| position |
	position := host indexOfSubCollection: self standardEndPoint.
	^ position < 3
		ifTrue: [ '' ]
		ifFalse: [ '/', (host copyFrom: 1 to: position - 2) ]