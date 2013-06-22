responses
ssoTwitter: request

	| oauthService requestToken html entity |

	oauthService := self twitterOAuth1Service.
	
	requestToken := oauthService getRequestTokenFor: request server url / 'sso-twitter-callback'.
	self twitterSessionFor: request put: requestToken.
	
	html := self htmlPageTitled: 'Zinc SSO Twitter Login' do: [ :stream |
		stream
			<< '<h3>Twitter SSO</h3>' ;
			<< '<a href="' ;
			<< (oauthService loginUrlFor: requestToken) asString ;
			<< '">Login with Twitter</a>' ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity