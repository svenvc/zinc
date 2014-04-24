public
handleAuthenticationCallback: aParameterDictionary 

	| code tokenRequest tokenResponse tokenData |

	code := aParameterDictionary at: 'code' ifAbsent: [ ^nil ].
	self authenticationState notNil
		ifTrue: [ self validateAuthenticationState: (aParameterDictionary at: 'state') ].

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
		
	self validateIdToken: (tokenData at: 'id_token').

	accessToken := tokenData at: 'access_token'.
	tokenType := tokenData at: 'token_type'.
	refreshToken := tokenData at: 'refresh_token' ifAbsent: [ nil ].