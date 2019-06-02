public
handleTokenRefresh
	| tokenRequest tokenResponse tokenData |
	
	tokenRequest  := (ZnRequest post: (ZnUrl fromString: self tokenEndpoint))
		entity: (ZnApplicationFormUrlEncodedEntity new
			at: 'client_id' put: self consumerData key ;
			at: 'client_secret' put: self consumerData secret ;
			at: 'grant_type' put: 'refresh_token' ;
			at: 'refresh_token' put: self refreshToken ;
			yourself) ;
		yourself.

	tokenResponse := ZnClient new 
		request: tokenRequest ;
		post.

	tokenData := NeoJSONReader fromString: tokenResponse.
	(tokenData includesKey: 'error')
		ifTrue: [ Error signal: (tokenData at: 'error') asString ].

	accessToken := tokenData at: 'access_token'.
	tokenType := tokenData at: 'token_type'.
