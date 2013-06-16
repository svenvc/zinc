resources
oauthConsumerData

	^ ZnOAuth2ConsumerData 
		key: (self application preferenceAt: #oauthFacebookClientId)
		secret: (self application preferenceAt: #oauthFacebookClientSecret)