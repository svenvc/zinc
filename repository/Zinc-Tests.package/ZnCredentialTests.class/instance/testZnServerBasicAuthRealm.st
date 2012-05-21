testing
testZnServerBasicAuthRealm
	self ignoringDeprecation: [ 
		self withServerDo: [ :server | | response client cred |
			server authenticator: (ZnBasicAuthenticator username: 'foo' password: 'secret' realm: 'TEST').
			client := ZnUserAgent new.
			response := client get: (server localUrl addPathSegments: #('echo' 'foo'); yourself).
			self assert: response headers contentType = ZnMimeType textPlain.
			self assert: response statusLine code = 401.
			self assert: ((response headers at: 'WWW-Authenticate') includesSubString: 'Basic').
			cred := (ZnCredential findHandlerFor: (response headers at: 'WWW-Authenticate')) new
				username: 'foo';
				password: 'secret';
				domain: client request url authority;
				yourself.
			cred linkToAuthRequest: (response headers at: 'WWW-Authenticate').
			self assert: cred realm = 'TEST'.
			client session addCredential: cred.
			response := client get: (server localUrl addPathSegments: #('echo' 'foo'); yourself).
			self assert: response statusLine code = 200 ] ]