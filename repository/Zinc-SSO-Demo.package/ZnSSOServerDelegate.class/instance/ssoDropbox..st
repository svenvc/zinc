responses
ssoDropbox: request

	| oauthService requestToken html entity |

	oauthService := self dropboxOAuth1Service.
	
	requestToken := oauthService getRequestToken.
	self dropboxSessionFor: request put: requestToken.
	
	html := self htmlPageTitled: 'Zinc SSO Dropbox Login' do: [ :stream |
		stream
			<< '<h3>Dropbox SSO</h3>' ;
			<< '<a href="' ;
			<< (oauthService loginUrlFor: requestToken callbackUrl: request server url / 'sso-dropbox-callback') asString ;
			<< '">Login with Dropbox</a>' ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity