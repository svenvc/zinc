accessing
httpClient
	^ ZnClient new
		timeout:  self class timeout;
		numberOfRetries: self class numberOfRetries;
		retryDelay: self class retryDelay;
		yourself