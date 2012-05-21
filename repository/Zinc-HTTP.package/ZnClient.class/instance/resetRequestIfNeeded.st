private
resetRequestIfNeeded
	request ifNil: [ ^ self ].
	state ifNotNil: [
		request 
			resetEntity: nil;
			headers: ZnHeaders defaultRequestHeaders.
		state := nil ]