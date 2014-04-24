as yet unclassified
authenticationUrl

	^ (ZnUrl fromString: 'https://www.amazon.com/ap/oa')
		queryAt: 'client_id' put: self consumerData key ;
		queryAt: 'response_type' put: 'code' ;
		queryAt: 'redirect_uri' put: self redirectUrl ;
		queryAt: 'scope' put: self scopeParameter ;
		yourself.
