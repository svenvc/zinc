initialization
initialize

	super initialize.

	self oauthService: (ZnOAuth1Service new
		providerAccount: (ZnOAuth1ConsumerData newForTwitterAuthentication
			consumer: (self application preferenceAt: #oauth1TwitterConsumerKey) ;
			consumerSecret: (self application preferenceAt: #oauth1TwitterConsumerSecret) ;
			yourself ))