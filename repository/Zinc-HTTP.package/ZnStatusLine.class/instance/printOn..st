printing
printOn: stream
	super printOn: stream.
	self code notNil
		ifFalse: [ ^ self ].
	stream nextPut: $(.
	self printCodeAndReasonOn: stream.
	stream nextPut: $)