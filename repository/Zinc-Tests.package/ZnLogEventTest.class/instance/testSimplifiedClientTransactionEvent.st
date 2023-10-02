testing
testSimplifiedClientTransactionEvent
	| event |
	(event := ZnSimplifiedClientTransactionEvent new)
		clientId: self clientId;
		request: self request;
		response: self response;
		requestDuration: self timing requestDuration;
		responseDuration: self timing responseDuration.
	self assert: event id isInteger.
	self assert: event processId isInteger.
	self assert: event timestamp <= DateAndTime now.
	self assert: event clientId equals: self clientId.
	self assert: event url equals: self request uri.
	self assert: event method equals: self request method.
	self assert: event responseCode equals: self response code.
	self assert: event size equals: self response contentLength.
	self assert: event duration equals: self timing requestDuration + self timing responseDuration.
	self assert: event printString isString.
	^ event