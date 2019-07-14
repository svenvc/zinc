public
handleTokenRefresh
	| tokenRequest tokenResponse |
	

	tokenRequest := (ZnRequest post: (ZnUrl fromString: self tokenEndpoint))
		entity: (ZnApplicationFormUrlEncodedEntity new
			at: 'client_id' put: self consumerData key;
			at: 'client_secret' put: self consumerData secret;
			at: 'grant_type' put: 'refresh_token';
			at: 'refresh_token' put: self refreshToken;
			yourself);
		yourself.

	tokenResponse := ZnClient new 
		request: tokenRequest;
		post.
	self updateTokens: (NeoJSONReader fromString: tokenResponse).