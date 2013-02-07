testing
testGetSmallHTMLDocument
	| mimeDocument |
	mimeDocument := ZnHTTPSocketFacade httpGetDocument: 'http://zn.stfx.eu/zn/small.html'.
	self assert: (mimeDocument contents includesSubstring: 'small').
	self assert: (mimeDocument contentType includesSubstring: 'text/html')