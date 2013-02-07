responses
ssoFacebookCallback: request

	| facebookSession |
	
	(self isOAuth2Callback: request)
		ifFalse: [ ^ self generateInvalidCallbackRequest ].
	
	facebookSession := self facebookSessionFor: request.
	facebookSession handleAuthenticationCallback: request uri query.
	
	^ ZnResponse redirect: 'sso-facebook-data'