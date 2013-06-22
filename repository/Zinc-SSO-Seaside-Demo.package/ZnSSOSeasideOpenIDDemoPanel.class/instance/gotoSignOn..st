actions
gotoSignOn: aCallbackUrl

	| authUrl |
	
	authUrl := self providerSession getAuthenticationRequestUrl: aCallbackUrl asString do: [ :request |
		request realm: (self application preferenceAt: #openidRealm).
		request axRequestNamesAndEmail
		"self openIDoptionsForm updateAuthenticationRequest: request "].

	self requestContext
		redirectTo: authUrl ;
		respond