instance creation
methodNotAllowed: request
	^ self new
		statusLine: ZnStatusLine methodNotAllowed;
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity textCRLF: 'Method Not Allowed ' , request method , ' ' , request uri pathQueryFragmentPrintString);
		yourself