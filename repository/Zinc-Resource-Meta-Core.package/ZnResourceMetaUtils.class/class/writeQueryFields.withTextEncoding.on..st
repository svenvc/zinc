conversions
writeQueryFields: dictionary withTextEncoding: encoding on: stream
	| first |
	first := true.
	dictionary keysAndValuesDo: [ :key :value |
		first ifFalse: [ stream nextPut: $& ].
		first := false.
		stream nextPutAll: (self encodePercent: key withEncoding: encoding).
		value isNil ifFalse: [
			stream 
				nextPut: $=;
				nextPutAll: (self encodePercent: value withEncoding: encoding) ] ]