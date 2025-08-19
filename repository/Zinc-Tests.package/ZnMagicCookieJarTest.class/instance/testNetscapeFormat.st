testing
testNetscapeFormat
	| jar1 c1 c2 fileReference jar2 |
	jar1 := ZnCookieJar new.
	c1 := ZnCookie fromString: self cookieString for: 'https://www.google.com' asZnUrl.
	c2 := ZnCookie fromString: self cookieStringAlt for: 'https://www.pharo-project.org' asZnUrl.
	c2 secure: true.
	jar1
		add: c1;
		add: c2.
	fileReference := FileSystem memory / 'cookies.txt'.
	jar1 writeNetscapeFormatTo: fileReference.
	jar2 := ZnCookieJar new.
	jar2 readNetscapeFormatFrom: fileReference.
	self assert: (jar2 cookies includes: c1).
	self assert: (jar2 cookies includes: c2).
	self assert: (jar2 cookiesForUrl: 'https://www.pharo-project.org' asZnUrl) anyOne secure