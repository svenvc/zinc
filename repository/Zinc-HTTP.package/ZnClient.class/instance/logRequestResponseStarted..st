logging
logRequestResponseStarted: initialMilliseconds
	"Log a request/response cycle with timing and bytes received info,
	similar to standard HTTP logging."
	
	self log transaction: [
		String streamContents: [ :stream |
			request requestLine printMethodAndUriOn: stream.  
			stream space; print: response code.
			response hasEntity ifTrue: [
				stream space; print: response entity contentLength; nextPut: $B ].  
			stream space; print: (Time millisecondsSince: initialMilliseconds); nextPutAll:  'ms' ] ]