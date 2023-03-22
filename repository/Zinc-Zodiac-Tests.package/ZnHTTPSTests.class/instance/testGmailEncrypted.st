testing
testGmailEncrypted
	| client |
	
	self ensureSocketStreamFactory.
	self isNativeSSLPluginPresent ifFalse: [ ^ self ].  
	
	client := ZnClient new.
	client
		maxNumberOfRedirects:  10;
		get: 'https://www.gmail.com'.
	[
		self 
			assert: client isSuccess 
			description: 'Response is success'.
		self 
			assert: (client contents includesSubstring: 'Google')
			description: 'Response includes string google'.    
		self 
			assert: (client contents includesSubstring: 'mail')
			description: 'Response includes string mail ']
	ensure: [
		client close ]
