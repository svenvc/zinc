testing
testDelete
	self
		withServerDo: [ :server |
			| response |
			response := ZnEasy
				delete:
					(server localUrl
						addPathSegments: #('echo' 'foo');
						yourself).
			self assert: response headers contentType equals: ZnMimeType textPlain.
			self assert: response statusLine code equals: 200.
			self assert: (response entity string includesSubstring: 'DELETE').
			self assert: (response entity string includesSubstring: 'foo') ]