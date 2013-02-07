as yet unclassified
gotoSignOn: aCallbackUrl
	"Redirect to the Facebook sigon webpage."
	
	oauthSession := (ZnOAuth2Session microsoft: self oauthConsumerData)
		redirectUrl: aCallbackUrl greaseString ;
		yourself.

	self requestContext
		redirectTo: oauthSession authenticationUrl ;
		respond