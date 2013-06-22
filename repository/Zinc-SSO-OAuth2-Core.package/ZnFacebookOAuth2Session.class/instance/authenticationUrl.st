public
authenticationUrl

	^ (ZnUrl fromString: 'https://graph.facebook.com/oauth/authorize')
		queryAt: 'client_id' put: self consumerData key ;
		queryAt: 'redirect_uri' put: self redirectUrl ;
		queryAt: 'scope' put: self scopeParameter ;
		yourself.
