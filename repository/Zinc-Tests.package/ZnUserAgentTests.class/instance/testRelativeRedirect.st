testing
testRelativeRedirect
	self ignoringDeprecation: [
		self withServerDo: [ :server | |  response client |
			server onRequestRespond: [ :request | 
				request uri firstPathSegment = 'one'
					ifTrue: [ ZnResponse redirect: 'two' ]
					ifFalse: [ 
						request uri firstPathSegment = 'two'
							ifTrue: [ ZnResponse ok: (ZnEntity text: 'OK!') ]
							ifFalse: [ ZnResponse notFound: request uri ] ] ].
			client := ZnUserAgent new.
			response := client 
				post: (server localUrl addPathSegment: 'one'; yourself) 
				data: (ZnEntity text: 'data').
			self assert: response isSuccess.
			self assert: response contents = 'OK!' ] ]