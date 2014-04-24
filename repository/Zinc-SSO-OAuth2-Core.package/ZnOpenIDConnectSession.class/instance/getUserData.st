public
getUserData

	| url response |
	
	url := (ZnUrl fromString: self userinfoEndpoint)
		queryAt: 'access_token' put: self accessToken;
		yourself.

	response := ZnClient new get: url.
	
	^ NeoJSONReader fromString: response