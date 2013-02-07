instance creation
serverError: string
	^ self new
		statusLine: ZnStatusLine internalServerError;
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity textCRLF: string);
		yourself