testing
testRedirectLoopAndTrail
	self withServerDo: [ :server | | client count |
		server onRequestRespond: [ :request |
			request uri firstPathSegment = 'follow'
				ifTrue: [ ZnResponse redirect: 'follow' ] ].

		(client := ZnClient new)
			url: server localUrl; addPath: 'follow';
			maxNumberOfRedirects: 10.
		self should: [ client get ] raise: ZnTooManyRedirects.
		client close.

		(client := ZnClient new)
			url: server localUrl; addPath: 'follow';
			maxNumberOfRedirects: 10.
		[ client get ] on: ZnTooManyRedirects do: [ :exception |
			self assert: exception isResumable.
			self assert: exception trail size equals: 10.
			self assert: (exception trail allSatisfy: [ :each | each = (server localUrl / 'follow') ]) ].
		client close.
		
		(client := ZnClient new)
			url: server localUrl; addPath: 'follow';
			maxNumberOfRedirects: 10.
		count := 0.
		[ client get ] on: ZnTooManyRedirects do: [ :exception |
			count := count + 1.
			exception trail size <= 30
				ifTrue: [ exception resume ]
				ifFalse: [ exception resume: #doNotRetry ] ].
		self assert: count equals: 4.
		client close ]