testing
testCustomMethod
	| client |
	self withServerDo: [ :server |
		server
			withOptions: [ :options |
				options at: #allowedMethods update: [ :allowedMethods | 
					allowedMethods copyWith: #PURGE ] ];
			onRequestRespond: [ :request |
				request method = #PURGE
					ifTrue: [ ZnResponse ok: (ZnEntity text: 'PURGE') ]
					ifFalse: [ ZnResponse badRequest: request ] ].
		(client := ZnClient new)
			withOptions: [ :options |
				options at: #allowedMethods update: [ :allowedMethods | 
					allowedMethods copyWith: #PURGE ] ];
			url: server localUrl;
			method: #PURGE;
			execute.
		self assert: client isSuccess.
		self assert: client contents equals: 'PURGE'.
		client close ]