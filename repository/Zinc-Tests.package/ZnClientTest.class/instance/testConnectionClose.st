testing
testConnectionClose
	self withServerDo: [ :server | | client |
		server onRequestRespond: [ :request |
			(ZnResponse ok: (ZnEntity textCRLF: 'OK'))
				setConnectionClose;
				yourself ].
		client := ZnClient new.
		client url: server localUrl.
		client get.
		self assert: client isSuccess.
		self deny: client isConnected.
		self assert: client connection isNil ]