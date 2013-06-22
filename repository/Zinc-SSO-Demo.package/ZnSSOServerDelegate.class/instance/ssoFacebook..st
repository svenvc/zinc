responses
ssoFacebook: request

	| facebookSession html entity |

	facebookSession := self facebookSessionFor: request.
		
	html := self htmlPageTitled: 'Zinc SSO Facebook Login' do:  [ :stream |
		stream
			<< '<h3>Facebook SSO</h3>' ;
			<< '<a href="' ;
			<< facebookSession authenticationUrl asString ;
			<< '">Login with Facebook</a>' ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity