testing
testGoogleEncrypted
	| client |
	self ensureSocketStreamFactory.
	self isNativeSSLPluginPresent ifFalse: [ ^ self ].
	
	client := ZnClient new.
	client
		get: 'https://encrypted.google.com/search?q=Smalltalk'.
		
	[ 
		self 
			assert: client isSuccess 
			description: 'Response is success'.
		self 
			assert: (client contents includesSubstring: 'Google')
			description: 'Response includes string google'.    
		self 
			assert: (client contents includesSubstring: 'Smalltalk')
			description: 'Response includes string Smalltalk '
	] ensure: [
		client close ]