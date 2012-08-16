accessing
at: name
	^ self httpClient
		username: username password: password;
		path: name;
		get