actions
signOnUsingOpenIDConnectGoogle: aCallbackUrl domain: aDomain
	
	self responsePanel: (ZnSSOSeasideOpenIdConnectDemoPanel new
		ssoSession: (
			(ZnGoogleOpenIDConnectSession withConsumerData: self googleOAuth2ConsumerData)
				hostedDomain: aDomain ;
				yourself )).

	self responsePanel gotoSignOn: aCallbackUrl