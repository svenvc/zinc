testing
testAbsoluteRedirect
	| response uri |
	uri := 'http://foo.com:8080/something/else/foo.txt?key=123'.
	response := ZnResponse redirect: uri asZnUrl.
	self assert: response code equals: 302.
	self assert: response isRedirect.
	self assert: response hasHeaders.
	self assert: (response headers at: 'Location') equals: uri.
	self assert: response hasEntity.
	self assert: (response entity contents includesSubstring: uri)