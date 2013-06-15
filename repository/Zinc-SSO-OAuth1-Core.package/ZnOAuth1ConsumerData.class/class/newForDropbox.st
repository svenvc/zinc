instance creation
newForDropbox

	^self new
		getRequestTokenUrl: 'https://api.dropbox.com/1/oauth/request_token' ;
		authorizeTokenUrl: 'https://www.dropbox.com/1/oauth/authorize' ;
		getAccessTokenUrl: 'https://api.dropbox.com/1/oauth/access_token' ;
		yourself