testing
testFromString
	| cookie |
	cookie := ZnCookie fromString: self cookieString for: 'www.google.com' asZnUrl.
	self assert: cookie name equals: 'PREF'.
	self assert: cookie path notNil.
	self assert: cookie domain equals: '.google.com'.
	self assert: cookie isExpired not