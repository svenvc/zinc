instance creation
badRequest: request
	^ self new
		statusLine: (ZnStatusLine badRequest);
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity text: 'Bad Request ', request method, ' ', request uri pathQueryFragmentPrintString, String crlf);
		yourself