testing
testPrintingSimple
	| url |
	(url := ZnUrl new)
		scheme: #http;
		host: 'www.seaside.st';
		port: 8080;
		addPathSegment: 'example';
		addPathSegment: 'foo.html';
		queryAt: 'q' put: '100';
		fragment: 'mark'.
	self assert: url authority equals: 'www.seaside.st:8080'.
	self assert: url isAbsolute.
	self assert: url isFilePath.
	self assert: url printString equals: 'http://www.seaside.st:8080/example/foo.html?q=100#mark'.
	self assert: url file equals: 'foo.html'.
	self assert: url directory equals: 'example'.
	self assert: url pathPrintString equals: '/example/foo.html'.
	self assert: url pathQueryFragmentPrintString equals: '/example/foo.html?q=100#mark'