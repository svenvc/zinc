printing
printCodeAndReasonOn: stream
	self code notNil
		ifTrue: [
			stream print: self code; space; nextPutAll: self reason ]