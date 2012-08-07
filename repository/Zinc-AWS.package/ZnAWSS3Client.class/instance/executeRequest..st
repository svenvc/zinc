private protocol
executeRequest: method
	self httpClient method: method asUppercase.
	self prepareRequest.
	self httpClient perform: method.
	self postProcessResponse.
	^ self httpClient response

