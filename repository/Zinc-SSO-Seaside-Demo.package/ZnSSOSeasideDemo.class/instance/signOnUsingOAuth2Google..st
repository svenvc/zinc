actions
signOnUsingOAuth2Google: aCallbackUrl
	
	self responsePanel: ZnSSOSeasideGoogleOAuth2DemoPanel new.
	self responsePanel gotoSignOn: aCallbackUrl