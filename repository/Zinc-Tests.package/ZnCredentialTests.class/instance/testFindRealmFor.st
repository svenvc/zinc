testing
testFindRealmFor
	self ignoringDeprecation: [ 
		self withServerDo: [ :server | | response client realm |
			server authenticator: (ZnBasicAuthenticator username: 'foo' password: 'secret').
			client := ZnUserAgent new.
			response := client get: (server localUrl addPathSegments: #('echo' 'foo'); yourself).
			self assert: response headers contentType = ZnMimeType textPlain.
			self assert: response statusLine code = 401.
			self assert: ((response headers at: 'WWW-Authenticate') includesSubString: 'Basic').
			realm := ZnCredential findRealmFor: (response headers at: 'WWW-Authenticate').
			self assert: (realm includesSubString: 'Zinc') ] ]