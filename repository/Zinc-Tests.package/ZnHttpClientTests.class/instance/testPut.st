testing
testPut
	self ignoringDeprecation: [ 
		self withServerDo: [ :server | | response data client |
			data := String streamContents: [ :stream | 1 to: 32 do: [ :each | stream nextPut: 'abc' atRandom ] ].
			client := ZnHttpClient new
				url: (server localUrl addPathSegments: #('echo' 'foo'); yourself);
				parameterAt: 'foo' put: 'bar';
				parameterAt: 'baz' put: 'bang'.
			response := client put.
			self assert: client contentType = ZnMimeType textPlain.
			self assert: client status = 200.
			self assert: (response includesSubString: 'PUT') ] ]