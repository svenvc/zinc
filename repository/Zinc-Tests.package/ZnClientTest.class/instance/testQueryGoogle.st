testing
testQueryGoogle
	| client |
	
	(client := ZnClient new)
		http;
		host: 'www.google.com';
		addPath: 'search';
		queryAt: 'q' put: 'Pharo Smalltalk';
		get.
	
	[	
		self 
			assert: client isSuccess 
			description: 'Response is success'.
			
		self 
			assert: (client response contentType matches: ZnMimeType textHtml)
			description: 'Response has content type html'.
		self 
			assert: (client contents includesSubstring: 'pharo.org')
			description: 'Response incudes string pharo.org'
	] ensure: [ client close ]