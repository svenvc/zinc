instance creation
badRequest: request
	^ self new
		statusLine: ZnStatusLine badRequest;
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity textCRLF: 'Bad Request ' , request method , ' ' , request uri pathQueryFragmentPrintString);
		yourself