testing
testGetSmallHTMLDocument
	| mimeDocument |
	mimeDocument := ZnHTTPSocketFacade httpGetDocument: 'http://homepage.mac.com/svc/Zinc-HTTP-Components/small.html'.
	self assert: (mimeDocument contents includesSubString: 'small').
	self assert: (mimeDocument contentType includesSubString: 'text/html')