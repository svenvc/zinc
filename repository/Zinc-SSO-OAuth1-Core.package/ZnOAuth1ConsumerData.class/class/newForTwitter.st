instance creation
newForTwitter

	^self new
		getRequestTokenUrl: 'https://api.twitter.com/oauth/request_token' ;
		authorizeTokenUrl: 'https://api.twitter.com/oauth/authorize' ;
		getAccessTokenUrl: 'https://api.twitter.com/oauth/access_token' ;
		accessTokenClass:  ZnOAuth1TwitterAccessToken ;
		yourself