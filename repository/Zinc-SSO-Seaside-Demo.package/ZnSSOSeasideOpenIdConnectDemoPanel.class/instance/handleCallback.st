actions
handleCallback
	"This method is invoked when the SSO provider redirects back to this application." 

	ssoSession handleAuthenticationCallback: self requestContext request fields.
	userData := ssoSession getUserData	