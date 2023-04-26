testing
testEcho
	self
		withServerDo: [ :server |
			| response |
			response := ZnEasy
				get:
					(server localUrl
						addPathSegments: #('echo' 'foo');
						yourself).
			self assert: response contentType equals: ZnMimeType textPlain.
			self assert: response statusLine code equals: 200.
			self assert: (response entity contents includesSubstring: 'Zinc').
			self assert: (response entity contents includesSubstring: 'foo').
			self assert: (response entity contents includesSubstring: server printString) ]