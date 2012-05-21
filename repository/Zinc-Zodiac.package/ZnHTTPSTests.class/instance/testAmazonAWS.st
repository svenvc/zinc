testing
testAmazonAWS
	| client |
	self ensureSocketStreamFactory.     
	(client := ZnClient new) 
		get: 'https://aws.amazon.com/'.
	self assert: client isSuccess.
	self assert: (client contents includesSubString: 'Amazon').
	client close