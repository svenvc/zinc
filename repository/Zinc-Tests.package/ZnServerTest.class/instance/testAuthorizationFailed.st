testing
testAuthorizationFailed
	self
		withServerDo: [ :server |
			| response |
			server authenticator: (ZnBasicAuthenticator username: 'foo' password: 'secret').
			response := ZnEasy
				get:
					(server localUrl
						addPathSegment: 'echo';
						yourself).
			self assert: response headers contentType equals: ZnMimeType textPlain.
			self assert: response statusLine code equals: 401.
			self assert: ((response headers at: 'WWW-Authenticate') includesSubstring: 'Basic').
			self assert: ((response headers at: 'WWW-Authenticate') includesSubstring: 'Zinc') ]