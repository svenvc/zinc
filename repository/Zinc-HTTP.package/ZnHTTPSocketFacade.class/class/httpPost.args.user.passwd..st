operations post
httpPost: urlObject args: arguments user: username passwd: password
	| client |
	(client := self client)
		url: urlObject; 
		setBasicAuthenticationUsername: username password: password;
		formAddAll: arguments;
		post.
	^ self mimeDocumentOrErrorStringFrom: client response uri: client request url

