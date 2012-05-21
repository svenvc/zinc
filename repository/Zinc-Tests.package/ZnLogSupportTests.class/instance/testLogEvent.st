testing
testLogEvent
	| logEvent now |
	now := TimeStamp now.
	logEvent := ZnLogEvent info: 'Testing'.
	self assert: logEvent timeStamp >= now.
	self assert: logEvent processId isInteger.
	self assert: logEvent category = #info.
	self assert: logEvent message = 'Testing'  