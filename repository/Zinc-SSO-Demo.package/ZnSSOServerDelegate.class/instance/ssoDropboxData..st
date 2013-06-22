responses
ssoDropboxData: request

	|  accessToken userAccess accountInfo rootInfo id html entity |
	
	accessToken := self dropboxSessionFor: request
		ifAbsent: [ ^ self generateInvalidCallbackRequest ].
		
	userAccess := ZnOAuth1DropboxUserAccess new
		oauth1Service: self dropboxOAuth1Service ;
		accessToken: accessToken.
		
	accountInfo := userAccess getAccountInfo.
	id := self manipulateDemoFile: userAccess.
	rootInfo := userAccess getRootInfo.
	
	html := self htmlPageTitled: 'Zinc SSO Dropbox Account Info' do: [ :stream | 
		stream << '<h3>Dropbox Account Info</h3>'.
		self printDictionary: accountInfo asHtmlOn: stream.
		stream << '<h3>Dropbox Root Info</h3>'.
		self printDictionary: rootInfo asHtmlOn: stream.
		stream << ('<h5>demo.txt manipulation id {1}</h5>' format: { id }).
		stream << '<p><a href="sso-reset?target=sso-dropbox">Reset</a></p>' ].

	entity := ZnEntity html: html. 
	^ ZnResponse ok: entity