actions
loginUrlFor: aToken
	"Answer the url to which we should redirect the user. If the user grants us access the provider will redirect
	the user to the callbackUrl. The redirect will contain a new token which we can use to get an access token."

	^self providerAccount authorizeTokenUrl asZnUrl
		queryAt: 'oauth_token' put: aToken value ;
		yourself