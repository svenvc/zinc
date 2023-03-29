testing
testJsonRESTGet
	| client |
	self class environment at: #STONJSON ifAbsent: [ ^ self skip ].
	self withServerDo: [ :server |
		server onRequestRespond: [ :request |
			request method = #GET
				ifTrue: [ ZnResponse ok: (ZnEntity json: '{"name":"pi","symbol":"π","value":3.141592653589793}') ]
				ifFalse: [ ZnResponse badRequest: request ] ].
		(client := ZnClient new)
			forJsonREST;
			get: server localUrl.
		self assert: client isSuccess.
		self assert: (client contents at: #name) equals: 'pi'.
		client close ]