public
getUserData

	| url response |
	
	url := (ZnUrl fromString: 'https://apis.live.net/v5.0/me')
		queryAt: 'access_token' put: self accessToken;
		yourself.

	response := ZnClient new get: url.
	
	^ ZnUtils defaultJSONReader fromString: response