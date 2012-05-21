operations
executeRequest: request
	"Execute request to our fixed scheme://host:port and return the response.
	Make sure that the URI inside request is as processed by #fixedUrl:"

	| initialMilliseconds response |
	initialMilliseconds := Time millisecondClockValue.
	self preProcessRequest: request.
	(response := self executeRequestOnceIgnoringErrors: request) isNil
		ifTrue: [
			response := [ self close; executeRequestOnce: request ] 
				ifCurtailed: [ self log debug: [ 'Failed' ]. self close ] ].
	self logRequest: request response: response started: initialMilliseconds.  
	^ response