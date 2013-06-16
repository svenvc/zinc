initialize-release
responseForGet: endpointUrl content: aString

	responses
		at: endpointUrl
		put: 	(ZnResponse ok: (ZnStringEntity xml: aString))