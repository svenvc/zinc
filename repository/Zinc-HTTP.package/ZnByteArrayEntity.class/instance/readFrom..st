initialize-release
readFrom: stream

	self contentLength
		ifNil: [
			self bytes: (ZnUtils readUpToEnd: stream limit: (ZnCurrentOptions at: #maximumEntitySize)).
			self contentLength: self bytes size
			]
		ifNotNil: [ | byteArray |

			self contentLength > (ZnCurrentOptions at: #maximumEntitySize)
				ifTrue: [ ZnEntityTooLarge signal ].
			byteArray := ByteArray ofSize: self contentLength.
			self contentLength > ZnUtils streamingBufferSize
				ifTrue: [ ZnUtils streamFrom: stream to: byteArray writeStream size: self contentLength ]
				ifFalse: [ stream next: self contentLength into: byteArray ].
			self bytes: byteArray
			]