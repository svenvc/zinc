testing
testGetSmallHTMLDocument
	self ignoringDeprecation: [ | url response |
		url := 'http://zn.stfx.eu/zn/small.html'.
		response := ZnUserAgent new get: url.
		self assert: response headers contentType = ZnMimeType textHtml.
		self assert: response statusLine code = 200.
		self assert: (response entity string includesSubString: 'small') ]