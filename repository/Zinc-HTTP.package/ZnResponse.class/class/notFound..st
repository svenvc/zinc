instance creation
notFound: url
	^ self new
		statusLine: (ZnStatusLine notFound);
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnEntity text: 'Not Found ', url asZnUrl pathQueryFragmentPrintString, String crlf);
		yourself