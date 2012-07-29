operations
keysIn: bucket query: query
	"Return a collection of ZnAWSS3Key objects describing the keys in bucket
	using optional URI query fields"
	
	| response |
	self endPoint: (self endPointForBucket: bucket).
	self httpClient url: '/'.
	query notNil ifTrue: [ self httpClient queryAddAll: query ].
	response := self executeRequest: #get.
	^ (response isSuccess and: [ response contentType = ZnMimeType applicationXml ])
		ifTrue: [ 
			self processKeysXml: response contents for: bucket ]
		ifFalse: [
			self error: 'Could not list keys' ]