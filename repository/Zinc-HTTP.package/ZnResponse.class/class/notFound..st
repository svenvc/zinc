instance creation
notFound: url
	^ self new
		statusLine: ZnStatusLine notFound;
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity textCRLF: 'Not Found ' , url asZnUrl pathQueryFragmentPrintString);
		yourself