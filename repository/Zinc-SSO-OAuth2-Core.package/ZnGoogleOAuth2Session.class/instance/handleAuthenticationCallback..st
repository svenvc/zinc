public
handleAuthenticationCallback: aParameterDictionary
	| code tokenRequest tokenResponse |
	
	code := aParameterDictionary at: 'code' ifAbsent: [ ^ nil ].
	tokenRequest := (ZnRequest post: (ZnUrl fromString: self tokenEndpoint))
		entity: (ZnApplicationFormUrlEncodedEntity new
			at: 'client_id' put: self consumerData key;
			at: 'client_secret' put: self consumerData secret;
			at: 'grant_type' put: 'authorization_code';
			at: 'code' put: code;
			at: 'redirect_uri' put: self redirectUrl;
			yourself);
		yourself.

	tokenResponse := ZnClient new
		request: tokenRequest;
		post.
	self updateTokens: (NeoJSONReader fromString: tokenResponse).