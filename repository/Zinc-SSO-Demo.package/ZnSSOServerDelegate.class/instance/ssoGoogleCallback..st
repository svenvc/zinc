responses
ssoGoogleCallback: request

	| googleSession |
	
	(self isOAuth2Callback: request)
		ifFalse: [ ^ self generateInvalidCallbackRequest ].

	googleSession := self googleSessionFor: request.
	googleSession handleAuthenticationCallback: request uri query.

	^ ZnResponse redirect: 'sso-google-data'