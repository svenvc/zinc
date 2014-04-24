instance creation
amazon: aConsumerData

	^ ZnAmazonOAuth2Session new
		setConsumerData: aConsumerData ;
		yourself