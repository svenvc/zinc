printing
printOn: stream
	super printOn: stream.
	(self method isNotNil and: [ self uri isNotNil ])
		ifFalse: [ ^ self ].
	stream nextPut: $(.
	self printMethodAndUriOn: stream.
	stream nextPut: $)