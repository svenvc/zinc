testing
testExceptionNotification
	"Cause a Notification and get a 200 response"
	
	| response |

	client
		addPathSegment: 'exception';
		addPathSegment: 'notification';
		get.
	self assert: client isSuccess.
	response := client response.
	self deny: response isError.
	self assert: response status equals: 200.

