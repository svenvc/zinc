testing
testEmpty
	"An empty database returns a empty array for GET /storage/objects"
	
	client
		addPathSegment: 'objects';
		get.
	self assert: client isSuccess.
	self assert: client contents equals: #()