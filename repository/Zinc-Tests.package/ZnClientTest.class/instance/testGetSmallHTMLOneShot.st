testing - external
testGetSmallHTMLOneShot
	| client |
	(client := self httpClient)
		beOneShot;
		url: self smallHtmlUrl;
		get.
	self assert: client isSuccess.
	self assert: client response contentType equals: ZnMimeType textHtml.
	self assert: (client contents includesSubstring: 'Small').
	self deny: client isConnected