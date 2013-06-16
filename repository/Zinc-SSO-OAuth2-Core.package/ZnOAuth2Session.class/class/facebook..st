instance creation
facebook: aConsumerData

	^ ZnFacebookOAuth2Session new
		setConsumerData: aConsumerData ;
		yourself