testing
testGetSmallHTMLStream
	| stream |
	stream := ZnHTTPSocketFacade httpGet: 'http://zn.stfx.eu/zn/small.html'.
	self assert: (stream contents includesSubString: 'small')