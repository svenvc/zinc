operations
delete
	self 
		sendMethod: [ self method: #DELETE for: self url headers: self headers data: self params ];
		resetParameters.
	^ self response contents