instance creation
redirect: url
	| location |
	location := url asZnUrl pathQueryFragmentPrintString.
	^ self new
		statusLine: (ZnStatusLine redirect);
		headers: ZnHeaders defaultResponseHeaders;
		setLocation: location;
		entity: (ZnEntity text: 'Redirect ', location, String crlf);
		yourself