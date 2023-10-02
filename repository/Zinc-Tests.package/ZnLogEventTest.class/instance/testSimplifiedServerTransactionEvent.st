testing
testSimplifiedServerTransactionEvent
	| event |
	(event := ZnSimplifiedServerTransactionEvent new)
		serverId: self serverId;
		request: self request;
		response: self response;
		timing: self timing.
	self assert: event id isInteger.
	self assert: event processId isInteger.
	self assert: event timestamp <= DateAndTime now.
	self assert: event serverId equals: self serverId.
	self assert: event url equals: self request uri.
	self assert: event method equals: self request method.
	self assert: event responseCode equals: self response code.
	self assert: event size equals: self response contentLength.
	self assert: event duration equals: self timing totalDuration.
	self assert: event printString isString.
	^ event