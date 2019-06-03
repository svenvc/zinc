public
authenticationUrlWithState: aStateString

	^ (ZnUrl fromString: self authorizationEndpoint)
		queryAt: 'response_type' put: 'code' ;
		queryAt: 'client_id' put: self consumerData key ;
		queryAt: 'redirect_uri' put: self redirectUrl ;
		queryAt: 'scope' put: self scopeParameter ;
		queryAt: 'state' put: aStateString ;
		queryAt: 'access_type' put: self accessType ;
		queryAt: 'prompt' put: self prompt ;
		yourself