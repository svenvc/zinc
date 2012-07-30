accessing
at: name put: entity
	^ self httpClient
		username: username password: password;
		entity: entity;
		path: name;
		put;
		isSuccess 