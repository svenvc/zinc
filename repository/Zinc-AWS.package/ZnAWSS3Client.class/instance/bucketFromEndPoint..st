private
bucketFromEndPoint: host
	| position |
	position := host indexOfSubCollection: self standardEndPoint.
	^ position < 3
		ifTrue: [ '' ]
		ifFalse: [ '/', (host copyFrom: 1 to: position - 2) ]