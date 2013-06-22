testing
testGetSmallHTMLTwice
	| client |
	(client := ZnClient new)
		url: 'http://zn.stfx.eu/zn/small.html';
		get.
	self assert: client isSuccess.
	self assert: client response contentType = ZnMimeType textHtml.
	self assert: (client contents includesSubstring: 'Small').
	client 
		url: '/zn/small.html';
		get.
	self assert: client isSuccess.
	self assert: client response contentType = ZnMimeType textHtml.
	self assert: (client contents includesSubstring: 'Small').
	client close.
