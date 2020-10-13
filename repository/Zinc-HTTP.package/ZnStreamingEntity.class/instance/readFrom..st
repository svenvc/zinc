initialize-release
readFrom: readStream

	self contentLength
		ifNil: [ self stream: readStream ]
		ifNotNil: [ | limitedStream |
			limitedStream := ZnLimitedReadStream on: readStream limit: self contentLength.
			self stream: limitedStream ]