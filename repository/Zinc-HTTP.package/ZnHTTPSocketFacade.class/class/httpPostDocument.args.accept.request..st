operations post
httpPostDocument: urlObject args: arguments accept: mimeType request: extraHeaders
	| client |
	(client := self client)
		url: urlObject; 
		accept: mimeType;
		formAddAll: arguments.
	self extendHeaders: client request headers with: extraHeaders. 
	client post.
	^ self mimeDocumentOrErrorStringFrom: client response uri: client request url
