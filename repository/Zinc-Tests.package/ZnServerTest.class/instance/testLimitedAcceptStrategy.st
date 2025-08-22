testing
testLimitedAcceptStrategy
	self withServerDo: [ :server | | client clients |
		server maximumNumberOfConcurrentConnections: 4.
		server acceptStrategy: #limited.
		server stop; start.
		clients := (1 to: 4) collect: [ :each |
			ZnClient new
				url: server localUrl;
				addPathSegment: #random;
				clientId: ('client-{1}' format: { each });
				timeout: 1;
				enforceHttpSuccess;
				get;
				yourself ].
		client := ZnClient new
			url: server localUrl;
			addPathSegment: #random;
			clientId: 'client-5';
			timeout: 1;
			yourself.
		"since there are now 4 open connections, no accept will happen and we time out"
		self should: [ client get ] raise: ConnectionTimedOut.
		clients do: [ :each | each close ].
		client get.
		"now the request passes"
		self assert: client isSuccess.
		client close.
		
		"now try closing one of the four open clients while we are waiting"
		clients do: [ :each | each get ].
		[ 0.5 second wait. clients first close ] fork.
		client get.
		"this passes while we are waiting since a connection becomes available"
		self assert: client isSuccess.
		client close.
		clients do: [ :each | each close ].
		]