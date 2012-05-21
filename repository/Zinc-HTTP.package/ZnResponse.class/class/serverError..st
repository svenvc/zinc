instance creation
serverError: string
	^ self new
		statusLine: (ZnStatusLine internalServerError);
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity text: string, String crlf);
		yourself