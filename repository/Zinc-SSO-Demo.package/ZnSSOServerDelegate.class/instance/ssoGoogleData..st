responses
ssoGoogleData: request

	| googleSession userData html entity |
	
	googleSession := self googleSessionFor: request.
	userData := googleSession getUserData.

	html := self htmlPageTitled: 'Zinc SSO Google UserData' do: [ :stream | 
		stream << '<h3>Google UserData</h3>'.
		self printDictionary: userData asHtmlOn: stream.
		stream << '<a href="sso-reset">Reset</a>'  ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity