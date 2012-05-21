testing
testIfModifiedSinceNotModified
	self
		ignoringDeprecation: [ 
			| client request response |
			client := ZnFixedClient host: 'caretaker.wolf359.be'.
			[ 
			request := ZnRequest get: (client fixedUrl: '/small.html').
			request setIfModifiedSince: (Date year: 2011 month: 1 day: 1).
			response := client executeRequest: request.
			self assert: response isNotModified.
			self assert: response hasEntity not ]
				ensure: [ client close ] ]