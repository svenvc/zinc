testing
testGoogleEncrypted
	| client |
	self ensureSocketStreamFactory.     
	(client := ZnClient new) 
		get: 'https://encrypted.google.com/search?q=Smalltalk'.
	self assert: client isSuccess.
	self assert: (client contents includesSubString: 'Google').    
	self assert: (client contents includesSubString: 'Smalltalk').
	client close