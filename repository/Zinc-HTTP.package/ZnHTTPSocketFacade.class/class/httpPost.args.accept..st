operations post
httpPost: urlObject args: arguments accept: mimeType
	| client |
	(client := self client)
		url: urlObject; 
		accept: mimeType;
		formAddAll: arguments;
		post.
	^ self streamOrErrorStringFrom: client response uri: client request url
