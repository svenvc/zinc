printing
printMethodAndUriOn: stream
	(self method isNotNil and: [ self uri isNotNil ])
		ifFalse: [ ^ self ].
	stream
		nextPutAll: self method;
		space.
	self uri printPathQueryFragmentOn: stream