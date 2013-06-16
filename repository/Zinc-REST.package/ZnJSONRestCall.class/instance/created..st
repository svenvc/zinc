public
created: uri
	^ (response := ZnResponse new)
		statusLine: ZnStatusLine created;
		headers: ZnHeaders defaultResponseHeaders;
		setLocation: uri;
		entity: (ZnEntity with: (NeoJSONWriter toString: uri) , String crlf type: ZnMimeType applicationJson);
		yourself