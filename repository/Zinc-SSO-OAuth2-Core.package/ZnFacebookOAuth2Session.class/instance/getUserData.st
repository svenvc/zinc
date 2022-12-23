public
getUserData

	| url response |
	
	url := (ZnUrl fromString: 'https://graph.facebook.com/me')
		queryAt: 'access_token' put: self accessToken;
		yourself.

	response := ZnClient new get: url.
	
	^ ZnUtils defaultJSONReader fromString: response