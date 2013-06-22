description
describeOn: config 

	(config string: #oauth1TwitterConsumerKey)
		group: #oauth;
		label: 'Twitter Consumer Key';
		comment: 'OAuth 1.0 consumer key'.
		
	(config string: #oauth1TwitterConsumerSecret)
		group: #oauth;
		label: 'Twitter Consumer Secret';
		comment: 'OAuth 1.0 consumer secret.'.	