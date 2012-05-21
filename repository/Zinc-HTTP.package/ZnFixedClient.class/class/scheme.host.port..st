instance creation
scheme: scheme host: hostName port: port
	^ self new
		scheme: scheme;
		host: hostName;
		port: port;
		yourself