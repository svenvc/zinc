instance creation
created: url
	| location |
	location := url asString.
	^ self new
		statusLine: ZnStatusLine created;
		headers: ZnHeaders defaultResponseHeaders;
		setLocation: location;
		entity: (ZnEntity textCRLF: 'Created ' , location);
		yourself