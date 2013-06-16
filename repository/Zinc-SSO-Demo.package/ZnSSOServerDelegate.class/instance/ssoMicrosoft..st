responses
ssoMicrosoft: request

	| microsoftSession html entity |

	microsoftSession := self microsoftSessionFor: request.
		
	html := self htmlPageTitled: 'Zinc SSO Microsoft Login' do: [ :stream |
		stream
			<< '<h3>Microsoft SSO</h3>' ;
			<< '<a href="' ;
			<< microsoftSession authenticationUrl asString ;
			<< '">Login with Microsoft</a>' ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity