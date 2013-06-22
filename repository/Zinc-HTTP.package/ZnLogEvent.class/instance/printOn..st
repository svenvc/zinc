printing
printOn: stream
	self message isNil
		ifFalse: [ 
			self printHeaderOn: stream.
			stream space; nextPutAll: self message ]