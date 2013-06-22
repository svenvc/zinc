testing
testGetSmallHTMLUrlConstruction
	| client |
	(client := ZnClient new)
		http;
		host: 'zn.stfx.eu';
		path: '/zn/small.html';
		get.
	self assert: client isSuccess.
	self assert: client response contentType = ZnMimeType textHtml.
	self assert: (client contents includesSubstring: 'Small').
	client close