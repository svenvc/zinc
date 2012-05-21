testing
testCookieAt
	self ignoringDeprecation: [ | url client response |
		url := 'http://www.google.com/' asZnUrl.
		client := ZnUserAgent new.
		response := client get: url.
		self assert: (client cookieAt: 'PREF') notNil ]