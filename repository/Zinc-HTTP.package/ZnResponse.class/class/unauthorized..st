instance creation
unauthorized: authString
	^ self new
		statusLine: (ZnStatusLine unauthorized);
		headers: ZnHeaders defaultResponseHeaders;
		setWWWAuthenticate: authString;
		entity: (ZnEntity text: 'Unauthorized', String crlf);
		yourself