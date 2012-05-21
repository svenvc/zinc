testing
testWikimedia
	| client |
	self ensureSocketStreamFactory.     
	(client := ZnClient new) 
		get: 'https://secure.wikimedia.org/'.
	self assert: client isSuccess.
	self assert: (client contents includesSubString: 'Wikimedia').
	client close