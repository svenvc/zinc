operations
head
	self url queryAddAll: self params.
	self 
		sendMethod: [ self method: #HEAD for: self url headers: self headers data: nil ];
		resetParameters.
	^ self response