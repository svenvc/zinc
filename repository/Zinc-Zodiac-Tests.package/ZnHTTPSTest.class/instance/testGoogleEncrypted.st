testing
testGoogleEncrypted
	| client |
	self ensureSocketStreamFactory.
	self isNativeSSLPluginPresent ifFalse: [ ^ self ].
	
	client := ZnClient new.
	client
		retryDelay: 10;
		numberOfRetries: 3;
		get: 'https://encrypted.google.com/search?q=Smalltalk'.
		
	[ 
		self 
			assert: client isSuccess 
			description: ('Response should be success. [{1}] received' format: {
				client response  statusLine}).
		self 
			assert: (client contents includesSubstring: 'Google')
			description: 'Response includes string google'.    
		self 
			assert: (client contents includesSubstring: 'Smalltalk')
			description: 'Response includes string Smalltalk '
	] ensure: [
		client close ]