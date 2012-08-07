testing
testGetSmallHTMLDocument
	| mimeDocument |
	mimeDocument := ZnHTTPSocketFacade httpGetDocument: 'http://zn.stfx.eu/zn/small.html'.
	self assert: (mimeDocument contents includesSubString: 'small').
	self assert: (mimeDocument contentType includesSubString: 'text/html')