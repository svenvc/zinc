logging
logRequest: request response: response started: initialMilliseconds
	self log transaction: [
		String streamContents: [ :stream |
			request requestLine printMethodAndUriOn: stream.  
			stream space; print: response code.
			response hasEntity ifTrue: [
				stream space; print: response entity contentLength; nextPut: $B ].  
			stream space; print: (Time millisecondsSince: initialMilliseconds); nextPutAll:  'ms' ] ]