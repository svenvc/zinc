instance creation
newForTwitterAuthentication
	"Twitter variant for authentication instead of authorization."

	^self newForTwitter 
		authorizeTokenUrl: 'https://api.twitter.com/oauth/authenticate' ;
		yourself