accessing
accessToken: aToken

	super accessToken: aToken.
	
	twitterAccess := ZnOAuth1TwitterUserAccess new
		oauth1Service: self oauthService ;
		accessToken: self accessToken ;
		yourself.