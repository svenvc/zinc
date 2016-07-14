testing
testCreateWithInvalidJson
	"Send invalid input and get a generic 500 error"
	
	| response |

	client
		addPathSegment: 'objects';
		contentWriter: nil;
		contents: #[1 2 3] asString, '{';
		post.
	self deny: client isSuccess.
	response := client response.
	self assert: response isError.
	self assert: response status equals: 500.

