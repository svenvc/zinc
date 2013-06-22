actions
signOnUsingOAuth2Facebook: aCallbackUrl
	
	self responsePanel: ZnSSOSeasideFacebookDemoPanel new.
	self responsePanel gotoSignOn: aCallbackUrl