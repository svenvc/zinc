logging
logResponse
	"Log a response that was just read"
	
	self log info: [ 
		'Read ', response printString ].
	self log debug: [
		String streamContents: [ :out | 
			out << 'Received headers'; crlf.
			response headers writeOn: out ] ]