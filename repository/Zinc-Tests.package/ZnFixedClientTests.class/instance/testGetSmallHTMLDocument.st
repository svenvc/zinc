testing
testGetSmallHTMLDocument
	self
		ignoringDeprecation: [ 
			| client response |
			client := ZnFixedClient host: 'zn.stfx.eu'.
			[ 
			response := client get: '/zn/small.html'.
			self assert: response headers contentType = ZnMimeType textHtml.
			self assert: response statusLine code = 200.
			self assert: (response entity string includesSubString: 'small') ]
				ensure: [ client close ] ]