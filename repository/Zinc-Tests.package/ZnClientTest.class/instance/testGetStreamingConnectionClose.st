testing
testGetStreamingConnectionClose
	self withServerDo: [ :server |
		| client result contents |
		server onRequestRespond: [ :request |
			(ZnResponse ok: (ZnEntity textCRLF: 'OK'))
				setConnectionClose;
				yourself ].
		result := (client := ZnClient new)
			url: server localUrl;
			streaming: true;
			get.
		self assert: client isSuccess.
		self assert: client response contentType equals: ZnMimeType textPlain.
		self assert: result isStream.
		self assert: client entity stream equals: result.
		contents := result upToEnd utf8Decoded.
		self assert: (contents includesSubstring: 'OK').
		client close ]