accessing
serverSentEventResponse
	"Create and return a proper Server-Sent Events response.
	I pass my handler to the response as a continuation.
	After the response is written out, the handler with be sent #run: 
	with the open HTTP connection as argument."
	
	^ ZnServerSentEventResponse new
		statusLine: ZnStatusLine ok;
		headers: ZnHeaders defaultResponseHeaders;
		handler: self handler;
		setContentType: ZnServerSentEvent mimeType;
		yourself