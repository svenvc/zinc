initialize-release
readFrom: stream
	self contentLength
		ifNil: [
			self bytes: (ZnUtils readUpToEnd: stream limit: (ZnCurrentOptions at: #maximumEntitySize)).
			self contentLength: self bytes size ]
		ifNotNil: [ | byteArray readCount |
			self contentLength > (ZnCurrentOptions at: #maximumEntitySize)
				ifTrue: [ ZnEntityTooLarge signal ].
			byteArray := ByteArray ofSize: self contentLength.
			readCount := self contentLength > ZnUtils streamingBufferSize
				ifTrue: [ ZnUtils streamFrom: stream to: byteArray writeStream size: self contentLength ]
				ifFalse: [ stream readInto: byteArray startingAt: 1 count: self contentLength ].
			readCount = self contentLength 
				ifTrue: [ self bytes: byteArray ]
				ifFalse: [ self bytes: (byteArray copyFrom: 1 to: readCount); contentLength: readCount ] ]