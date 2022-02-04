testing
testHeadSmallHTMLDocument
	| url response |
	url := self smallHtmlUrl.
	response := ZnEasy head: url.
	self assert: response headers contentType equals: ZnMimeType textHtml.
	self assert: response statusLine code equals: 200.
	self assert: response hasEntity not