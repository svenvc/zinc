operations get
httpGet: urlObject args: queryArguments user: username passwd: password
	| client |
	(client := self client)
		url: (self extendUrl: urlObject withArguments: queryArguments);
		setBasicAuthenticationUsername: username password: password;
		get.
	^ self streamOrErrorStringFrom: client response uri: client request url