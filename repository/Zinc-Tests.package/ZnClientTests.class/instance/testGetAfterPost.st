testing
testGetAfterPost
	self withServerDo: [ :server | | client |
		server onRequestRespond: [ :request | 
			request uri firstPathSegment = 'one'
				ifTrue: [
					self assert: (request method = #POST).
					self assert: request hasEntity. 
					ZnResponse ok: (ZnEntity text: 'OK for one') ]
				ifFalse: [
					request uri firstPathSegment = 'two'
						ifTrue: [ 
							self assert: (request method = #GET).
							self deny: request hasEntity.
							ZnResponse ok: (ZnEntity text: 'OK for two') ]
		 				ifFalse: [ ZnResponse notFound: request uri ] ] ].
		(client := ZnClient new) 
			url: server localUrl;
			url: 'one';
			entity: (ZnEntity text: 'One two three');
			post.
		self assert: client isSuccess.
		self assert: client contents = 'OK for one'.
		client
			url: 'two';
			get.
		self assert: client isSuccess.
		self assert: client contents = 'OK for two'.
		client close ]