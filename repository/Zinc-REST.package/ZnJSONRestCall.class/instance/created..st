public
created: uri
	^ (response := ZnResponse new)
		statusLine: ZnStatusLine created;
		headers: ZnHeaders defaultResponseHeaders;
		setLocation: uri;
		entity: (ZnEntity with: (self toJson: uri), String crlf type: ZnMimeType applicationJson);
		yourself