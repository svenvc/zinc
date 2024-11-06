testing
testQuery
	"Any query parameters are seen as a conjunctive filter.
	Here we execute a GET /storage/object?string=five to find a entry where
	the key 'string' equals 'five'. Note that the uri is returned."
	| data objectUri |

	client addPathSegment: 'objects'.
	1 to: 10 do: [ :each |
		data := Dictionary with: 'int' -> each with: 'string' -> each asWords.
		client
			contents: data;
			post.
		self assert: client isCreated ].
	client resetEntity.
	client
		queryAt: 'string' put: 'five';
		get.
	self assert: client isSuccess.
	objectUri := client contents first.	
	client
		url: objectUri; 
		get.
	self assert: client isSuccess.
	self assert: (client contents at: 'int') equals: 5