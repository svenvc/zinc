testing
testJsonRESTPost
	| client |
	self class environment at: #STONJSON ifAbsent: [ ^ self skip ].
	self withServerDo: [ :server |
		server onRequestRespond: [ :request |
			request method = #POST
				ifTrue: [
					self assert: request contentType equals: ZnMimeType applicationJson.
					ZnResponse ok: request entity ]
				ifFalse: [ ZnResponse badRequest: request ] ].
		(client := ZnClient new)
			forJsonREST;
			post: server localUrl contents: { #foo->1. #bar->'Test' } asDictionary.
		self assert: client isSuccess.
		self assert: (client contents at: #foo) equals: 1.
		client close ]