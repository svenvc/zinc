testing
testGetSmallHTMLDocument
	| url response |
	url := self smallHtmlUrl.
	response := ZnEasy get: url.
	self assert: response headers contentType equals: ZnMimeType textHtml.
	self assert: response statusLine code equals: 200.
	self assert: (response entity string includesSubstring: 'small')