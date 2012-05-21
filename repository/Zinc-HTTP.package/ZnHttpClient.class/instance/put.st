operations
put
	self 
		sendMethod: [ self method: #PUT for: self url headers: self headers data: self params ];
		resetParameters.
	^ self response contents