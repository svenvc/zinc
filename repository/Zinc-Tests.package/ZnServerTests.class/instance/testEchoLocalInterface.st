testing
testEchoLocalInterface
	| server response |
	(server := ZnServer on: self port)
		bindingAddress: NetNameResolver loopBackAddress.
	[ 
		server start.
		self assert: server isRunning & server isListening.
		response := ZnEasy get: (server localUrl addPathSegments: #('echo' 'foo'); yourself).
		self assert: (response contentType = ZnMimeType textPlain).
		self assert: (response statusLine code = 200).
		self assert: (response entity contents includesSubString: 'Zinc').
		self assert: (response entity contents includesSubString: 'foo')
	]
		ensure: [ server stop ]