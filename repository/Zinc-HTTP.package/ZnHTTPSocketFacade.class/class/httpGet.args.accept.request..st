operations get
httpGet: urlObject args: queryArguments accept: mimeType request: extraHeaders
	| client |
	(client := self client)
		url: (self extendUrl: urlObject withArguments: queryArguments);
		accept: mimeType.
	self extendHeaders: client request headers with: extraHeaders. 
	client get.
	^ self streamOrErrorStringFrom: client response uri: client request url
