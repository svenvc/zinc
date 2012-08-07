accessing
list
	self httpClient
		username: username password: password;
		path: self basePath;
		headerAt: 'Depth' put: '1';
		method: #PROPFIND;
		entity: (ZnEntity xml: self propFindQuery);
		execute.
	^ self parsePropFindResponse: self httpClient contents