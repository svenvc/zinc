testing
testQueryGoogle
	| client |
	
	"Finally give up as all search engines sadly refuse API style calls like this one after a while, especially on CI servers"
	self skip. 
	
	(client := ZnClient new)
		http;
		host: 'www.google.com';
		addPath: 'search';
		queryAt: 'q' put: 'Pharo Smalltalk';
		retryDelay: 20;
		numberOfRetries: 3;
		get.
	
	[	
		self 
			assert: (client isSuccess or: [client response code = 429])
			description: ('Response should be success or 429 code. [{1}] received' format: {
				client response  statusLine}).
		self 
			assert: (client response contentType matches: ZnMimeType textHtml)
			description: 'Response has content type html'.
		client isSuccess  ifTrue: [
			self 
				assert: (client contents includesSubstring: 'pharo.org')
				description: 'Response incudes string pharo.org' ]
	] ensure: [ client close ]