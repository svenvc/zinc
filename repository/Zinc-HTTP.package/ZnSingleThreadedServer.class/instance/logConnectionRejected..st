private - logging
logConnectionRejected: socketStream
	logLevel < 3 ifTrue: [ ^ nil ].
	^ (self newLogEvent: ZnConnectionRejectedEvent)
		address: ([ socketStream socket remoteAddress ] on: Error do: [ nil ]);
		emit