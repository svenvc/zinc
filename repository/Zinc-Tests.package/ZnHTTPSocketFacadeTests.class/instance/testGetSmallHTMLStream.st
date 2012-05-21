testing
testGetSmallHTMLStream
	| stream |
	stream := ZnHTTPSocketFacade httpGet: 'http://homepage.mac.com/svc/Zinc-HTTP-Components/small.html'.
	self assert: (stream contents includesSubString: 'small')