responses
ssoMicrosoftData: request

	| microsoftSession userData html entity |
	
	microsoftSession := self microsoftSessionFor: request.
	userData := microsoftSession getUserData.

	html := self htmlPageTitled: 'Zinc SSO Microsoft UserData' do: [ :stream | 
		stream << '<h3>Microsoft UserData</h3>'.
		self printDictionary: userData asHtmlOn: stream .
		stream << '<a href="sso-reset">Reset</a>' ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity