testing
testDigestAuthorizationFailure
	self ignoringDeprecation: [ 
		self withServerDo: [ :server | | response client cred |
			self
				assert: ZnDigestAuthenticator hasMD5Support
				description: 'MD5 hashing support is required for Digest authentication.'.
			server authenticator: (ZnDigestAuthenticator username: 'foo' password: 'secret' realm: 'TEST').
			client := ZnUserAgent new.	
			response := client get: (server localUrl addPathSegments: #('echo' 'foo'); yourself).
			self assert: response headers contentType = ZnMimeType textPlain.
			self assert: response statusLine code = 401.
			self assert: ((response headers at: 'WWW-Authenticate') includesSubString: 'Digest').
			cred := (ZnCredential findHandlerFor: (response headers at: 'WWW-Authenticate')) new
				username: 'foo';
				password: 'wrong';
				domain: client request url authority;
				yourself.
			cred linkToAuthRequest: (response headers at: 'WWW-Authenticate').
			client session addCredential: cred.
			response := client get: (server localUrl addPathSegments: #('echo' 'foo'); yourself).
			self assert: response statusLine code = 401 ] ]