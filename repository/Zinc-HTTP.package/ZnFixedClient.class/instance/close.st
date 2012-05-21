initialize-release
close
	connection ifNil: [ ^ self ].
	self log debug: 'Closing connection'.
	connection close. 
	connection := nil.
	lastUsed := nil