actions
gotoSignOn: aCallbackUrl
	"Redirect the client to the OAuth provider to handle the sign-in and authorization."

	self checkSetUp.

	requestToken := self oauthService getRequestTokenFor: aCallbackUrl with: self requestTokenExtraParameters.
	
	self requestContext
		redirectTo: (self oauthService loginUrlFor: requestToken) ; 
		respond
	