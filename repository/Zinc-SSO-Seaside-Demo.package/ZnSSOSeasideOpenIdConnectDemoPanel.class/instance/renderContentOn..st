rendering
renderContentOn: html

	html heading
		level2 ;
		with: 'OpenID Connect'.
		
	html paragraph: [ 
		html text: 'Issuer: '.
		html strong: self ssoSession issuer ].
		
	userData isNil
		ifTrue: [ 
			html strong: 'No user data'.
			^ self ].

	html heading
		level3;
		with: 'getOpenIdConnect response'.
		
	self renderJSONDict: userData on: html.