testing
testFindHandlerFor
	self ignoringDeprecation: [ 
		self withServerDo: [ :server | | response client handler |
			server authenticator: (ZnBasicAuthenticator username: 'foo' password: 'secret').
			client := ZnUserAgent new.
			response := client get: (server localUrl addPathSegments: #('echo' 'foo'); yourself).
			self assert: response headers contentType = ZnMimeType textPlain.
			self assert: response statusLine code = 401.
			self assert: ((response headers at: 'WWW-Authenticate') includesSubString: 'Basic').
			handler := ZnCredential findHandlerFor: (response headers at: 'WWW-Authenticate').
			self assert: handler = ZnBasicCredential ] ]