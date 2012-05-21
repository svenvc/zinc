logging
logRequest
	"Log a request that was just written"
	
	self log info: [ 
		'Wrote ', request printString ].
	self log debug: [
		String streamContents: [ :out | 
			out << 'Sent headers'; crlf.
			request headers writeOn: out ] ]