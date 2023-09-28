private - logging
newLogEvent: logEventClass
	^ logEventClass new
		serverId: (self serverId ifNil: [ self route ]);
		yourself