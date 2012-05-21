testing
testSimple 
	| logSupport memoryLogger |
	logSupport := ZnLogSupport newEnabled.
	memoryLogger := ZnMemoryLogger new.
	logSupport addListener: memoryLogger.
	logSupport info: 'Testing'.
	self assert: memoryLogger logEvents first message = 'Testing'.
	logSupport removeListener: memoryLogger.
	logSupport info: 'Void'.
	self assert: memoryLogger logEvents size = 1     
	