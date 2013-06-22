responses
ssoOpenIDCallback: request

	| service authResponse html |

	service := self openIdServiceFor: (request url queryAt: 'provider' ifAbsent: [ nil ]).
	
	authResponse := service getValidatedAuthenticationResponseFrom:	request url query.
		
	html := self htmlPageTitled: 'Zinc SSO OpenID result for ', service providerName do: [ :stream | 
		stream << '<h3>' ; << service providerName ; << ' result</h3>'.
		self printDictionary: authResponse properties asHtmlOn: stream .
		stream << '<a href="sso-reset">Reset</a>' ].

	^ ZnResponse ok: (ZnEntity html: html)