actions
signOnUsingOAuth2Microsoft: aCallbackUrl
	
	self responsePanel: ZnSSOSeasideMicrosoftDemoPanel new.
	self responsePanel gotoSignOn: aCallbackUrl