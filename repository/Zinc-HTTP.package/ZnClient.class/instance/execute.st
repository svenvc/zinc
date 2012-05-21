operations
execute
	"Execute the currently set up request to generate a response.
	Return the #contents of the response, if any."
	
	| initialMilliseconds result |
	initialMilliseconds := Time millisecondClockValue.
	self prepareRequest.
	result := self executeWithTimeout.
	self logRequestResponseStarted: initialMilliseconds.
	^ result