responses
ssoMicrosoftCallback: request

	| microsoftSession |
	
	(self isOAuth2Callback: request)
		ifFalse: [ ^ self generateInvalidCallbackRequest ].

	microsoftSession := self microsoftSessionFor: request.
	microsoftSession handleAuthenticationCallback: request uri query.

	^ ZnResponse redirect: 'sso-microsoft-data'