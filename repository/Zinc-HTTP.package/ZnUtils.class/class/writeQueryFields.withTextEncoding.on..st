conversions
writeQueryFields: dictionary withTextEncoding: encoding on: stream
	| first |
	first := true.
	dictionary keysAndValuesDo: [ :key :value |
		first ifFalse: [ stream nextPut: $& ].
		first := false.
		stream nextPutAll: (key encodeForHTTPWithTextEncoding: encoding).
		value isNil ifFalse: [
			stream 
				nextPut: $=;
				nextPutAll: (value encodeForHTTPWithTextEncoding: encoding) ] ]