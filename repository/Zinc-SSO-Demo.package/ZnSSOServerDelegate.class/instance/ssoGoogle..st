responses
ssoGoogle: request

	| googleSession html entity |
	
	googleSession := self googleSessionFor: request.
		
	html := self htmlPageTitled: 'Zinc SSO Google Login' do: [ :stream |
		stream
			<< '<h3>Google SSO</h3>' ;
			<< '<a href="' ;
			<< googleSession authenticationUrl asString ;
			<< '">Login with Google</a>' ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity