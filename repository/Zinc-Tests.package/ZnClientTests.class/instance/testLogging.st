testing
testLogging
	| client memoryLogger |
	memoryLogger := ZnMemoryLogger new.
	(client := ZnClient new)
		beOneShot.
	client log addListener: memoryLogger.
	client	get: 'http://zn.stfx.eu/zn/small.html'.
	client close.
	self deny: memoryLogger logEvents isEmpty