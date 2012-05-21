testing
testExtendUrlWithArgs
	| url |
	url := ZnHTTPSocketFacade 
		extendUrl: 'http://www.foo.com/bar' 
		withArguments: (Dictionary new
			at: 'x' put: #('1');
			at: 'z' put: #('aaa' 'bbb');
			yourself).
	self assert: url host = 'www.foo.com'.
	self assert: url path = 'bar'.
	self assert: (url queryAt: 'x') = '1'.
	self assert: (url queryAt: 'z') = #('aaa' 'bbb')