actions
signOnUsingOpenID2: aProviderName callbackUrl: aUrl
	"Redirect to the sign in page of the OpenID provider."
	
	| providerSession |
	
	providerSession := self openIDSingleSignOn sessionForProviderNamed: aProviderName.
	
	self responsePanel: (ZnSSOSeasideOpenIDDemoPanel new
		setProviderSession: providerSession ;
		"openIDoptionsForm: self openIDoptionsForm ;"
		yourself ).
		
	self responsePanel gotoSignOn: aUrl