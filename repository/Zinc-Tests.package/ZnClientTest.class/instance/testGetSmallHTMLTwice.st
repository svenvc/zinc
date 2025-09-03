testing - external
testGetSmallHTMLTwice
	| client |
	(client := self httpClient)
		url: self smallHtmlUrl;
		get.
	self assert: client isSuccess.
	self assert: client response contentType equals: ZnMimeType textHtml.
	self assert: (client contents includesSubstring: 'Small').
	client
		url: self smallHtmlUrl pathPrintString;
		get.
	self assert: client isSuccess.
	self assert: client response contentType equals: ZnMimeType textHtml.
	self assert: (client contents includesSubstring: 'Small').
	client close