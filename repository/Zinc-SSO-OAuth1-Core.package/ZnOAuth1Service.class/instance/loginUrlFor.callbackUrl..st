actions
loginUrlFor: aToken callbackUrl: anUrl
	"Answer the url to which we should redirect the user. If the user grants us access the provider will redirect
	the user to the callbackUrl. The redirect will contain a new token which we can use to get an access token.
	
	This method should be used with OAuth 1.0 providers. Use #loginUrlFor: with OAuth 1.0a providers."

	^(self loginUrlFor: aToken)
		queryAt: 'oauth_callback' put: anUrl ;
		yourself
	