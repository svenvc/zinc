class initialization
register

	| application |
	
	application := WAAdmin register: self asApplicationAt: 'zinc-sso-demo'.
	
	application configuration
		addParent: ZnOpenIDConfiguration instance ;
		addParent: ZnOAuth1TwitterConfiguration instance ;
		addParent: ZnOAuth2FacebookConfiguration instance ;
		addParent: ZnOAuth2GoogleConfiguration instance ;
		addParent: ZnOAuth2MicrosoftConfiguration instance.

	application
		addLibrary: ZnSSOSeasideDemoFileLibrary.
		
	application
		preferenceAt: #oauth2GoogleRedirectUrl put: 'http://localhost:8080/oauth2callback'.
	self registerCallbackHandlerAt: 'oauth2callback'.
	
	^ application