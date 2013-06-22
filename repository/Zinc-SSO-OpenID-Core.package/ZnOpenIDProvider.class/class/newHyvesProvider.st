instance creation
newHyvesProvider
	
	^ self new
		name: 'Hyves' ;
		imgUrl: 'http://openid.net/images/get-logos/hyves.png';
		altText: 'Login with your Hyves account';
		discoveryUrl: 'http://www.hyves.nl/api/openid/xrds/';
		shouldValidateClaimedIdBelongsToEndpoint: false ;
		yourself
