instance creation
methodNotAllowed: request
	^ self new
		statusLine: (ZnStatusLine methodNotAllowed);
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity text: 'Method Not Allowed ', request method, ' ', request uri pathQueryFragmentPrintString, String crlf);
		yourself