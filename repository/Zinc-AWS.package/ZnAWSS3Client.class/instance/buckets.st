operations
buckets
	"Return an array of all  AWS S3 bucket name strings for the account"
	
	| response |
	self endPoint: self standardEndPoint.
	self httpClient url: '/'.
	response := self executeRequest: #get.
	^ (response isSuccess and: [ response contentType = ZnMimeType applicationXml ])
		ifTrue: [
			self processBucketsXml: response contents ]
		ifFalse: [
			self error: 'Could not list buckets' ]