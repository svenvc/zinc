private
endPointForBucket: bucketKey
	^ String streamContents: [ :stream |
		stream 
			nextPutAll: bucketKey;
			nextPut: $.; 
			nextPutAll: self standardEndPoint ]