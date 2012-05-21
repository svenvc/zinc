testing
testGetSmallHTMLDocument
	self
		ignoringDeprecation: [ 
			| client response |
			client := ZnFixedClient host: 'homepage.mac.com'.
			[ 
			response := client get: '/svc/Zinc-HTTP-Components/small.html'.
			self assert: response headers contentType = ZnMimeType textHtml.
			self assert: response statusLine code = 200.
			self assert: (response entity string includesSubString: 'small') ]
				ensure: [ client close ] ]