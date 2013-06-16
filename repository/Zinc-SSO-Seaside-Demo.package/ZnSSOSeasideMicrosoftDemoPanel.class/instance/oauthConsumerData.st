as yet unclassified
oauthConsumerData

	^ ZnOAuth2ConsumerData 
		key: (self application preferenceAt: #oauth2MicrosoftClientId)
		secret: (self application preferenceAt: #oauth2MicrosoftClientSecret)