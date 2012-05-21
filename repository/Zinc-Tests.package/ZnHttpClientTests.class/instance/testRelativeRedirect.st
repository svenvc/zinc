testing
testRelativeRedirect
	self ignoringDeprecation: [ 
		self withServerDo: [ :server | | response client |
			server onRequestRespond: [ :request | 
				request uri firstPathSegment = 'one'
					ifTrue: [ ZnResponse redirect: 'two' ]
					ifFalse: [ 
						request uri firstPathSegment = 'two'
							ifTrue: [ ZnResponse ok: (ZnEntity text: 'OK!') ]
							ifFalse: [ ZnResponse notFound: request uri ] ] ].
			(client := ZnHttpClient new) url: (server localUrl addPathSegment: 'one'; yourself).
			response := client post.
			self assert: response = 'OK!' ] ]