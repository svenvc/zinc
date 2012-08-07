testing
testHeadSmallHTMLDocument
	self ignoringDeprecation: [ | url response |
		url := 'http://zn.stfx.eu/zn/small.html'.
		response := ZnUserAgent new head: url.
		self assert: response headers contentType = ZnMimeType textHtml.
		self assert: response statusLine code = 200 ]