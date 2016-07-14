testing
testExceptionError
	"Cause an AssertionFailure and get a 500 error"
	
	| response |

	client
		addPathSegment: 'exception';
		addPathSegment: 'assertion';
		get.
	self deny: client isSuccess.
	response := client response.
	self assert: response isError.
	self assert: response status equals: 500.

