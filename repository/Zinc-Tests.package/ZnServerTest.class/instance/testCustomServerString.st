testing
testCustomServerString
	self withServerDo: [ :server | | client |
		server localOptions at: #serverString put: 'foobar server'.
		(client := ZnClient new)
			get: server localUrl;
			close.
		self assert: (client response headers at: 'Server') equals: 'foobar server' ]