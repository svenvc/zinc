I am ZnSSOServerDelegate, an example/test using SSO.

(ZnServer startOn: 8100)
	delegate: (ZnSSOServerDelegate new
		facebookData: (ZnOAuth2ConsumerData 
			key: '538399976180189'
			secret: '***************'
			redirectUrl: 'http://localhost:8100/sso-facebook-callback');
		googleData: (ZnOAuth2ConsumerData 
			key: '81499955779.apps.googleusercontent.com'
			secret: '***************'
			redirectUrl: 'http://localhost:8100/sso-google-callback');
		twitterData: (ZnOAuth1ConsumerData newForTwitterAuthentication 
			consumer: '5PAXu9CygKPD0aKwjnGdOA' ;
			consumerSecret: '*********');
		yourself);
	yourself.
