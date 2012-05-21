testing
testBasicAuthorization
	self ignoringDeprecation: [ 
		self withServerDo: [ :server | | response client |
			server authenticator: (ZnBasicAuthenticator username: 'foo' password: 'secret').
			client := ZnHttpClient new
				url: (server localUrl addPathSegments: #('echo' 'foo'); yourself);
				auth: 'foo' password: 'secret'.
			response := client get.
			self assert: client contentType = ZnMimeType textPlain.
			self assert: client status = 200 ] ]