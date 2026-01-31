testing
testMirror
	| client data |
	self withServerDo: [ :server |
		(client := ZnClient new)
			url: server localUrl;
			addPath: 'mirror'.
		client get.
		self assert: client isSuccess.
		self deny: client response hasEntity.
		data := String loremIpsum.
		client contents: data; post.
		self assert: client isSuccess.
		self assert: client response hasEntity.
		self assert: client response contents equals: data.
		data := { #x->100. #y->200 } asDictionary.
		client forJsonREST; contents: data; post.
		self assert: client isSuccess.
		self assert: client response hasEntity.
		self assert: (client contents at: #x) equals: (data at: #x).
		self assert: (client contents at: #y) equals: (data at: #y).
		client close ]