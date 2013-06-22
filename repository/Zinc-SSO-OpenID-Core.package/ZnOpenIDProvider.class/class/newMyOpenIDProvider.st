instance creation
newMyOpenIDProvider

	^ self new
		name: 'myOpenID' ;
		imgUrl: 'http://openid.net/images/get-logos/myopenid.png';
		altText: 'Login with your myOpenID account' ;
		discoveryUrl: 'http://www.myopenid.com/xrds';
		shouldValidateClaimedIdBelongsToEndpoint: false ;
		yourself
