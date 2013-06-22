private
writeBodyOfSize: size on: stream
	| mask |
	masked
		ifTrue: [
			mask := ZnWebSocketUtils newMask.
			stream nextPutAll: mask ].
	size = 0 ifTrue: [ ^ self ].
	masked 
		ifTrue: [
			body doWithIndex: [ :each :index |
				stream nextPut: (each bitXor: (mask at: ((index - 1) \\ 4) + 1)) ] ] 
		ifFalse: [ self writeRawBodyOn: stream ]