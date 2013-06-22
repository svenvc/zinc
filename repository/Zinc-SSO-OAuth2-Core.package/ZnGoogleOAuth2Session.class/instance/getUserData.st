public
getUserData

	| url response |
	
	url := (ZnUrl fromString: 'https://www.googleapis.com/oauth2/v1/userinfo')
		queryAt: 'access_token' put: self accessToken;
		yourself.

	response := ZnClient new get: url.
	
	^ NeoJSONReader fromString: response