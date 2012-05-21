testing
testGetSmallHTMLStreaming
	| client result contents |
	result := (client := ZnClient new)
		url: 'http://zn.stfx.eu/zn/small.html';
		streaming: true;
		get.
	self assert: client isSuccess.
	self assert: client response contentType = ZnMimeType textHtml.
	self assert: result isStream.
	self assert: client entity stream = result.
	contents := result upToEnd.
	self assert: (contents includesSubString: 'Small').
	client close