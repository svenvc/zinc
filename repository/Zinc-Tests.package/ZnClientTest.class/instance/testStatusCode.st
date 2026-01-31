testing
testStatusCode
	| client |
	self withServerDo: [ :server |
		client := ZnClient new.
		ZnConstants httpStatusCodes keysAndValuesDo: [ :code :reason |
			client
				dontFollowRedirects;
				url: server localUrl;
				addPathSegment: 'status-code';
				addPathSegment: code asString;
				get.
			self assert: client response code equals: code.
			"Content is ignored for some codes, see ZnResponse>>#readEntityFrom:"
			client contents ifNotNil: [
				self assert: (client contents includesSubstring: reason) ] ].
		client close ]