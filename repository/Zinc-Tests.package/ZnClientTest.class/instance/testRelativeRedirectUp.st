testing
testRelativeRedirectUp
	self withServerDo: [ :server | | client |
		server onRequestRespond: [ :request |
			request uri pathSegments asArray = #('a' 'b' 'c.txt')
				ifTrue: [ ZnResponse redirect: '../d.txt' ]
				ifFalse: [
					request uri pathSegments asArray = #('a' 'd.txt')
						ifTrue: [ ZnResponse ok: (ZnEntity text: 'OK!') ]
		 				ifFalse: [ ZnResponse notFound: request uri ] ] ].
		(client := ZnClient new)
			url: server localUrl; addPath: #('a' 'b' 'c.txt');
			post.
		self assert: client isSuccess.
		self assert: client contents equals: 'OK!'.
		client close ]