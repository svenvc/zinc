responses
ssoOpenID: request

	| service serverUrl callbackUrl authUrl |
	
	service := self openIdServiceFor: (request url queryAt: 'provider' ifAbsent: [ nil ]).

	serverUrl  := request server url.
	callbackUrl := (serverUrl / 'sso-openid-callback')
		queryAt: 'provider' put: (request url queryAt: 'provider') ;
		yourself.
	
	authUrl := service getAuthenticationRequestUrl: callbackUrl do: [ :authRequest |
		authRequest realm: serverUrl asString.
		authRequest axRequestNamesAndEmail
		"self openIDoptionsForm updateAuthenticationRequest: authRequest "].
	
	^ ZnResponse redirect: authUrl