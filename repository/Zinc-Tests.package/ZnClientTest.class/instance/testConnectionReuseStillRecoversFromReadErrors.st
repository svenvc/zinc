testing
testConnectionReuseStillRecoversFromReadErrors
	self withServerDo: [ :server | | client connection failNextRead |
		server onRequestRespond: [ :request | ZnResponse ok: (ZnEntity text: 'OK') ].
		client := ZnClient new.
		client url: server localUrl; numberOfRetries: 0.
		[ self assert: client get equals: 'OK'.
			connection := client connection.
			failNextRead := true.
			client reader: [ :stream |
				failNextRead ifTrue: [ failNextRead := false. NetworkError signal: 'Simulated read error' ].
				ZnResponse readFrom: stream ].
			self assert: client get equals: 'OK'.
			self deny: client connection == connection
		] ensure: [ client close ] ]