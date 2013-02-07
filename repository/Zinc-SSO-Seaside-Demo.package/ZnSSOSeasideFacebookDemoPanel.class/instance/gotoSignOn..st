actions
gotoSignOn: aCallbackUrl
	"Redirect to the Facebook sigon webpage."
	
	oauthSession := (ZnOAuth2Session facebook: self oauthConsumerData)
		redirectUrl: aCallbackUrl greaseString ;
		yourself.

	self requestContext
		redirectTo: oauthSession authenticationUrl ;
		respond