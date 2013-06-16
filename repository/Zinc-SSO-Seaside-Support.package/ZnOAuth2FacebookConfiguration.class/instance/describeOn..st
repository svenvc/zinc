description
describeOn: config 

	(config string: #oauthFacebookClientId)
		group: #oauth;
		label: 'Facebook client_id';
		comment: 'OAuth 2.0 client_id for Facebook.'.
		
	(config string: #oauthFacebookClientSecret)
		group: #oauth;
		label: 'Facebook client_secret';
		comment: 'OAuth 2.0 client_secret for Facebook.'