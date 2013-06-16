responses
ssoFacebookData: request

	| facebookSession userData html entity |
	
	facebookSession := self facebookSessionFor: request.
	userData := facebookSession getUserData.

	html := self htmlPageTitled: 'Zinc SSO Facebook UserData' do: [ :stream | 
		stream << '<h3>Facebook UserData</h3>'.
		self printDictionary: userData asHtmlOn: stream.
		stream << '<a href="sso-reset">Reset</a>' ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity