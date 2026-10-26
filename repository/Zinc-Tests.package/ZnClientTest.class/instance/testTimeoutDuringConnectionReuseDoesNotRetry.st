testing
testTimeoutDuringConnectionReuseDoesNotRetry
	self withServerDo: [ :server | | client calls result |
		calls := 0.
		server onRequestRespond: [ :request |
			calls := calls + 1.
			calls > 1 ifTrue: [ (Delay forMilliseconds: 500) wait ].
			ZnResponse ok: (ZnEntity text: 'OK') ].
		client := ZnClient new.
		client url: server localUrl; numberOfRetries: 0.
		[ self assert: client get equals: 'OK'.
			self assert: client isConnected.
			result := [ client get ] valueWithin: (Duration milliSeconds: 50) onTimeout: [ #timedOut ].
			self assert: result equals: #timedOut.
			self assert: calls equals: 2
		] ensure: [ client close ] ]