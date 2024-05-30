testing
testGoogleEncrypted
	| client |
	self ensureSocketStreamFactory.
	self isNativeSSLPluginPresent ifFalse: [ ^ self ].
	
	client := ZnClient new.
	client
		retryDelay: 1;
		numberOfRetries: 3;
		get: 'https://encrypted.google.com/search?q=Smalltalk'.
	
	[ 
		self 
			assert: (client isSuccess or: [client response code = 429])
			description: ('Response should be success or 429 code. [{1}] received' format: {
				client response  statusLine}).
		self 
			assert: (client contents includesSubstring: 'Google')
			description: 'Response includes string google'.    
		client isSuccess  ifTrue: [
			self 
				assert: (client contents includesSubstring: 'Smalltalk')
				description: 'Response includes string Smalltalk ' ]
	] ensure: [
		client close ]