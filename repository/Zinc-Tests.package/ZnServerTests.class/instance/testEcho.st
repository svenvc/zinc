testing
testEcho
	self withServerDo: [ :server | | response |
		response := ZnEasy get: (server localUrl addPathSegments: #('echo' 'foo'); yourself).
		self assert: (response contentType = ZnMimeType textPlain).
		self assert: (response statusLine code = 200).
		self assert: (response entity contents includesSubString: 'Zinc').
		self assert: (response entity contents includesSubString: 'foo') ]