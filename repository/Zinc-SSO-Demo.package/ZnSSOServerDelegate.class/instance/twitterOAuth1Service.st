accessing
twitterOAuth1Service

	^ ZnOAuth1Service new
		providerAccount: self twitterData ;
		yourself