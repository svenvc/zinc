private
handleRequest: request
	"Handle request and return a response.
	If we have a delegate, pass the responsability.
	If we have no delegate, we return a page not found"

	| response initialMilliseconds |

	initialMilliseconds := Time millisecondClockValue.
	response := self
		authenticateRequest: request
		do: [ 
			self delegate isNil
				ifTrue: [ ZnResponse notFound: request uri ]
				ifFalse: [ self delegate handleRequest: request ] ].
	request method = #HEAD
		ifTrue: [ response clearEntity ].
	self logRequest: request response: response started: initialMilliseconds.
	^ response