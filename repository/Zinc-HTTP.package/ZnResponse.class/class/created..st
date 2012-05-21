instance creation
created: url
	| location |
	location := url asZnUrl pathQueryFragmentPrintString.
	^ self new
		statusLine: (ZnStatusLine created);
		headers: ZnHeaders defaultResponseHeaders;
		setLocation: location;
		entity: (ZnEntity text: 'Created ', location, String crlf);
		yourself