actions
signOnUsingOAuth1Twitter: aCallbackUrl
	
	self responsePanel: ZnSSOSeasideTwitterOAuth1DemoPanel new.
	self responsePanel gotoSignOn: aCallbackUrl