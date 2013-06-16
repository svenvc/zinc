testing
testLocalUrl
	self
		withServerDo: [ :server | 
			self assert: server localUrl scheme equals: #http.
			self assert: server localUrl host equals: 'localhost'.
			self assert: server localUrl port equals: server port ]