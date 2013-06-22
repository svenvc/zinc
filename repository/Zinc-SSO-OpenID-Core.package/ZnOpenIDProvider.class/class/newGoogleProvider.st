instance creation
newGoogleProvider
	
	^self new
		name: 'Google';
		imgUrl: 'http://openid.net/images/get-logos/google.png' ;
		altText: 'Login with your Gmail account' ;
		discoveryUrl: 'https://www.google.com/accounts/o8/id' ;
		shouldValidateClaimedIdBelongsToEndpoint: true ;
		yourself