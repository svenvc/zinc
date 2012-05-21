testing
testHeadSmallHTMLDocument
	| url response |
	url := 'http://homepage.mac.com/svc/Zinc-HTTP-Components/small.html'.
	response := ZnEasy head: url.
	self assert: (response headers contentType = ZnMimeType textHtml).
	self assert: (response statusLine code = 200).
	self assert: response hasEntity not