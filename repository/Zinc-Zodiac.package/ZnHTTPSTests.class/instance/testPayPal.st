testing
testPayPal
	| client |
	self ensureSocketStreamFactory.     
	(client := ZnClient new) 
		get: 'https://www.paypal.com'.
	self assert: client isSuccess.
	self assert: (client contents includesSubString: 'PayPal').
	client close