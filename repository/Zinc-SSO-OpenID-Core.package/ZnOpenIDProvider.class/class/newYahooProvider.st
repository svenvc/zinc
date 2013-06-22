instance creation
newYahooProvider
	
	^ self new
		name: 'Yahoo' ;
		imgUrl: 'http://openid.net/images/get-logos/yahoo.png';
		altText: 'Login with your Yahoo account';
		discoveryUrl: 'http://open.login.yahooapis.com/openid20/www.yahoo.com/xrds';
		shouldValidateClaimedIdBelongsToEndpoint: false ;
		yourself
