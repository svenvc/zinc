as yet unclassified
handleAuthenticationCallback: aParameterDictionary 

	| code url oauthResponse |
	
	code := aParameterDictionary at: 'code' ifAbsent: [ ^nil ].

	url := (ZnUrl fromString: 'https://api.amazon.com/auth/o2/token')
		queryAt: 'grant_type' put: 'authorization_code' ;
		queryAt: 'client_id' put: self consumerData key ;
		queryAt: 'client_secret' put: self consumerData secret ;
		queryAt: 'code' put: code;
		yourself.
	
	oauthResponse := ZnClient new get: url.
	
	accessToken := (self fieldDictionaryFrom: oauthResponse) at: 'access_token'.