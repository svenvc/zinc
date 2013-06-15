instance creation
redirect: url
	| location |
	location := url asString.
	^ self new
		statusLine: ZnStatusLine redirect;
		headers: ZnHeaders defaultResponseHeaders;
		setLocation: location;
		entity: (ZnEntity textCRLF: 'Redirect ' , location);
		yourself