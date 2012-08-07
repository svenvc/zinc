testing
testPayPal
	| client |
	self ensureSocketStreamFactory.
	self isNativeSSLPluginPresent ifFalse: [ ^ self ].
	(client := ZnClient new) 
		get: 'https://www.paypal.com'.
	self assert: client isSuccess.
	self assert: (client contents includesSubString: 'PayPal').
	client close