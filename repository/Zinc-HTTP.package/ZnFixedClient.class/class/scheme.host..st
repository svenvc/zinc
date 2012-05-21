instance creation
scheme: scheme host: hostName
	^ self 
		scheme: scheme 
		host: hostName 
		port: (ZnUrl defaultPortForScheme: scheme)