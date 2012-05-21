testing
testFilter
	| logSupport memoryLogger |
	logSupport := ZnLogSupport newEnabled.
	memoryLogger := ZnMemoryLogger new.
	memoryLogger filter: #info.
	logSupport addListener: memoryLogger.
	logSupport info: 'Testing'.
	self assert: memoryLogger logEvents first message = 'Testing'.
	logSupport debug: 'Void'.
	self assert: memoryLogger logEvents size = 1     
	