testing
testTooManyHeaders
	self withServerDo: [ :server | | response client |
		self deny: server debugMode.
		client := ZnClient new 
			url: server localUrl;
			addPathSegment: #echo;
			yourself.
		client request headers unlimited.
		1 to: 256 do: [ :each |
			 client headerAt: ('X-Test-', each printString) put: each printString ].
		response := client 
			get; 
			response.
		client close.
		self deny: response isSuccess.
		self assert: response code equals: 400.
		self assert: response contentType equals: ZnMimeType textPlain.
		self assert: (response entity contents includesSubstring: 'ZnTooManyDictionaryEntries') ]