testing
testServerTransactionEvent
	| event |
	(event := ZnServerTransactionEvent new)
		serverId: self serverId;
		request: self request;
		response: self response;
		timing: self timing.
	self assert: event id isInteger.
	self assert: event processId isInteger.
	self assert: event timestamp <= DateAndTime now.
	self assert: event serverId equals: self serverId.
	self assert: event request uri equals: self request uri.
	self assert: event request method equals: self request method.
	self assert: event response code equals: self response code.
	self assert: event duration equals: self timing totalDuration.
	self assert: event printString isString.
	^ event