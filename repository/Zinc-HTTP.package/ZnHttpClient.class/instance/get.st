operations
get
	self url queryAddAll: self params.
	self 
		sendMethod: [ self method: #GET for: self url headers: self headers data: nil ];
		resetParameters.
	^ self response contents