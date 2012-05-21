initialize-release
readFrom: stream
	"We parse from stream, limited to content length if available."
	
	| readStream |
	representation := nil.
	self contentLength isNil
		ifTrue: [ readStream := stream ]
		ifFalse: [ (readStream := ZnLimitedReadStream on: stream limit: self contentLength) ascii ].
	fields := ZnUtils parseQueryFrom: readStream