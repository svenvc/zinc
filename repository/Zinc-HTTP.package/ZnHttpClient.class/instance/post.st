operations
post
	self 
		sendMethod: [ self method: #POST for: self url headers: self headers data: self params ];
		resetParameters.
	^ self response contents