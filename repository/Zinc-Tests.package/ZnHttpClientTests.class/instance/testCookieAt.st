testing
testCookieAt
	self ignoringDeprecation: [ | client response |
		client := ZnHttpClient new url: 'http://www.pharo-project.org'.
		response := client get.
		self assert: (client cookieAt: 'cmsbox') notNil ]