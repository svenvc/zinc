initialize-release
initialize

	super initialize.
	
	self prefixMap
		at: 'sso-demo' put: #ssoDemo: ;
		at: 'sso-reset' put: #ssoReset: ;
		at: 'sso-google' put: #ssoGoogle: ;
		at: 'sso-google-callback' put: #ssoGoogleCallback: ;
		at: 'sso-google-data' put: #ssoGoogleData: ;
		at: 'sso-facebook' put: #ssoFacebook: ;
		at: 'sso-facebook-callback' put: #ssoFacebookCallback: ;
		at: 'sso-facebook-data' put: #ssoFacebookData: ;
		at: 'sso-microsoft' put: #ssoMicrosoft: ;
		at: 'sso-microsoft-callback' put: #ssoMicrosoftCallback: ;
		at: 'sso-microsoft-data' put: #ssoMicrosoftData: ;
		at: 'sso-twitter' put: #ssoTwitter: ;
		at: 'sso-twitter-callback' put: #ssoTwitterCallback: ;
		at: 'sso-twitter-data' put: #ssoTwitterData: ;
		at: 'sso-dropbox' put: #ssoDropbox: ;
		at: 'sso-dropbox-callback' put: #ssoDropboxCallback: ;
		at: 'sso-dropbox-data' put: #ssoDropboxData: ;
		at: 'sso-openid' put: #ssoOpenID: ;
		at: 'sso-openid-callback' put: #ssoOpenIDCallback: 

