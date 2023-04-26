testing
testTooManyConcurrentConnections
	self usingClassicSocketStreamsOnWindowsDo: [
		self withServerDo: [ :server | | client clients |
			self deny: server debugMode.
			server maximumNumberOfConcurrentConnections: 4.
			clients := (1 to: 4) collect: [ :each |
				ZnClient new
					url: server localUrl;
					addPathSegment: #random;
					clientId: ('client-{1}' format: { each });
					enforceHttpSuccess;
					get;
					yourself ].
			client := ZnClient new
					url: server localUrl;
					addPathSegment: #random;
					clientId: 'client-5';
					get;
					yourself.
			self assert: client response code equals: 503.
			clients do: [ :each |
				each get; close ].
			client get.
			self assert: client isSuccess.
			client close ] ]