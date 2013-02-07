instance creation
newForGoogle

	^self new
		getRequestTokenUrl: 'https://www.google.com/accounts/OAuthGetRequestToken' ;
		authorizeTokenUrl: 'https://www.google.com/accounts/OAuthAuthorizeToken' ;
		getAccessTokenUrl: 'https://www.google.com/accounts/OAuthGetAccessToken' ;
		yourself