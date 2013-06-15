request handling
handleRequest: request
	"Handle request and return a response.
	Do logging and timing. Set a dynamic variable referencing the server.
	If necessary do session management in the response."

	| response initialMilliseconds |
	initialMilliseconds := Time millisecondClockValue.
	ZnCurrentServerSession value: nil.
	response := self handleRequestProtected: request.
	request method = #HEAD
		ifTrue: [ response clearEntity ].
	self logRequest: request response: response started: initialMilliseconds.
	ZnCurrentServerSession value 
		ifNotNil: [ :session | self sessionManager setSession: session in: response ].
	^ response