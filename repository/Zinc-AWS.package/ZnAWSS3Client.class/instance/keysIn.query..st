operations
keysIn: bucket query: query
	"Return a collection of ZnAWSS3Key objects describing the keys in bucket
	using optional URI query fields"
	
	| response keys dom |
	self endPoint: (self endPointForBucket: bucket).
	self httpClient url: '/'.
	query notNil ifTrue: [ self httpClient queryAddAll: query ].
	keys := nil.
	^ Array streamContents: [ :out |
		[ 
			keys ifNotNil: [ self httpClient queryAt: 'marker' put: keys last key ].
			response := self executeRequest: #get.
			(response isSuccess and: [ response contentType = ZnMimeType applicationXml ])
				ifFalse: [ ^ self error: 'Could not list keys' ].
			dom := XMLDOMParser parse: response contents.
			keys:= self processKeysXml: dom for: bucket.
			out nextPutAll: keys.
			self isListBucketResultTruncated: dom ] whileTrue ]