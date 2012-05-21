testing
testDigestAuthorization
	self ignoringDeprecation: [
		self withServerDo: [ :server | | response client |
			server authenticator: (ZnDigestAuthenticator username: 'foo' password: 'secret' realm: 'TEST').
			client := ZnHttpClient new
				url: (server localUrl addPathSegments: #('echo' 'foo'); yourself);
				digestAuth: 'foo' password: 'secret'.
			response := client get.
			self assert: client contentType = ZnMimeType textPlain.
			self assert: client status = 200 ] ]