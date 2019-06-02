public
handleAuthenticationCallback: aParameterDictionary 

	| code tokenRequest tokenResponse tokenData |
	
	code := aParameterDictionary at: 'code' ifAbsent: [ ^nil ].

	tokenRequest  := (ZnRequest post: (ZnUrl fromString: self tokenEndpoint))
		entity: (ZnApplicationFormUrlEncodedEntity new
			at: 'code' put: code ;
			at: 'client_id' put: self consumerData key ;
			at: 'client_secret' put: self consumerData secret ;
			at: 'redirect_uri' put: self redirectUrl ;
			at: 'grant_type' put: 'authorization_code' ;
			yourself) ;
		yourself.

	tokenResponse := ZnClient new 
		request: tokenRequest ;
		post.
	tokenData := NeoJSONReader fromString: tokenResponse.
		
	accessToken := tokenData at: 'access_token'.
	tokenType := tokenData at: 'token_type'.
	(tokenData includesKey: 'refresh_token')
		ifTrue: [ refreshToken := tokenData at: 'refresh_token' ].
