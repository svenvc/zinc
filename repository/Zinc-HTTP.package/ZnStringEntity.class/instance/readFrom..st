initialize-release
readFrom: stream
	self contentLength isNil 
		ifTrue: [ self readUpToEndFrom: stream ] 
		ifFalse: [ self readLimitedFrom: stream ]