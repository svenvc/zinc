testing
testPut
	self ignoringDeprecation: [ 
		self withServerDo: [ :server | | response data client |
			data := String streamContents: [ :stream | 1 to: 32 do: [ :each | stream nextPut: 'abc' atRandom ] ].
			client := ZnUserAgent new.
			response := client 
				put: (server localUrl addPathSegments: #('echo' 'foo'); yourself) 
				data: (ZnEntity text: data).
			self assert: response headers contentType = ZnMimeType textPlain.
			self assert: response statusLine code = 200.
			self assert: (response entity string includesSubString: 'PUT').
			self assert: (response entity string includesSubString: data) ] ]