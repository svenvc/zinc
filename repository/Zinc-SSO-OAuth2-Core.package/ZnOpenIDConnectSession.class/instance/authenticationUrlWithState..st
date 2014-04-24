public
authenticationUrlWithState: aStateString

	| authUrl |

	authUrl := (ZnUrl fromString: self authorizationEndpoint)
		queryAt: 'response_type' put: 'code' ;
		queryAt: 'client_id' put: self consumerData key ;
		queryAt: 'redirect_uri' put: self redirectUrl ;
		queryAt: 'scope' put: self scopeParameter ;
		queryAt: 'state' put: aStateString ;
		queryAddAll: self extraAuthenticationParameters ;
		yourself.

	^authUrl