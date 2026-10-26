testing
testConnectionReusePropagatesResumableNotifications
	self withServerDo: [ :server | | client connection notifications |
		server onRequestRespond: [ :request | ZnResponse ok: (ZnEntity text: 'OK') ].
		client := ZnClient new.
		client url: server localUrl; numberOfRetries: 0.
		[ self assert: client get equals: 'OK'.
			connection := client connection.
			notifications := 0.
			client reader: [ :stream | Notification signal. ZnResponse readFrom: stream ].
			[ self assert: client get equals: 'OK' ]
				on: Notification
				do: [ :notification | notifications := notifications + 1. notification resume ].
			self assert: notifications equals: 1.
			self assert: client connection identicalTo: connection
		] ensure: [ client close ] ]