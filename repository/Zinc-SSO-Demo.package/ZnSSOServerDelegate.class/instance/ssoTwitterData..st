responses
ssoTwitterData: request

	|  accessToken userData html entity |
	
	accessToken := self twitterSessionFor: request
		ifAbsent: [ ^ self generateInvalidCallbackRequest ].
		
	userData := ZnOAuth1TwitterUserAccess new
		oauth1Service: self twitterOAuth1Service ;
		accessToken: accessToken ;
		accountVerifyCredentials.
	
	html := self htmlPageTitled: 'Zinc SSO Twitter UserData' do: [ :stream | 
		stream << '<h3>Twitter UserData</h3>'.
		self printDictionary: userData asHtmlOn: stream .
		stream << '<a href="sso-reset">Reset</a>' ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity