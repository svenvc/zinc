public
handleAuthenticationCallback: aParameterDictionary 

	| code url oauthResponse |
	
	code := aParameterDictionary at: 'code' ifAbsent: [ ^nil ].

	url := (ZnUrl fromString: 'https://graph.facebook.com/oauth/access_token')
		queryAt: 'client_id' put: self consumerData key ;
		queryAt: 'redirect_uri' put: self redirectUrl ;
		queryAt: 'client_secret' put: self consumerData secret ;
		queryAt: 'code' put: code;
		yourself.
	
	oauthResponse := ZnClient new get: url.
	
	accessToken := (self fieldDictionaryFrom: oauthResponse) at: 'access_token'.