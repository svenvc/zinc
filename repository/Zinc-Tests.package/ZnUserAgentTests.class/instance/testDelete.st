testing
testDelete
	self ignoringDeprecation: [ 
		self withServerDo: [ :server | | response client |
			client := ZnUserAgent new.
			response := client delete: (server localUrl addPathSegments: #('echo' 'foo'); yourself).
			self assert: response headers contentType = ZnMimeType textPlain.
			self assert: response statusLine code = 200.
			self assert: (response entity string includesSubString: 'DELETE').
			self assert: (response entity string includesSubString: 'foo') ] ]