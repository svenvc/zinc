testing
testGetSmallHTMLDocument
	| url response |
	url := 'http://homepage.mac.com/svc/Zinc-HTTP-Components/small.html'.
	response := ZnEasy get: url.
	self assert: (response headers contentType = ZnMimeType textHtml).
	self assert: (response statusLine code = 200).
	self assert: (response entity string includesSubString: 'small')