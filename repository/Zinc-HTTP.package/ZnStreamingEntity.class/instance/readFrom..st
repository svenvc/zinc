initialize-release
readFrom: readStream
	self contentLength isNil
		ifTrue: [ 
			self stream: readStream ]
		ifFalse: [ | limitedStream |
			limitedStream := ZnLimitedReadStream on: readStream limit: self contentLength.
			self contentType isBinary 
				ifTrue: [ limitedStream binary ] 
				ifFalse: [ limitedStream ascii ]. 
			self stream: limitedStream ]