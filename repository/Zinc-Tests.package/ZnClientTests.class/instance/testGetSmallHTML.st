testing
testGetSmallHTML
	| client |
	(client := ZnClient new)
		url: 'http://zn.stfx.eu/zn/small.html';
		get.
	self assert: client isSuccess.
	self assert: client isContentTypeAcceptable.
	self assert: client response contentType = ZnMimeType textHtml.
	self assert: (client contents includesSubString: 'Small').
	self assert: client isConnected.
	client close.
	self deny: client isConnected