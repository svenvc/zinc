public
authenticationUrl

	^ (ZnUrl fromString: 'https://login.live.com/oauth20_authorize.srf')
		queryAt: 'response_type' put: 'code' ;
		queryAt: 'client_id' put: self consumerData key ;
		queryAt: 'redirect_uri' put: self redirectUrl ;
		queryAt: 'scope' put: self scopeParameter ;
		yourself.
