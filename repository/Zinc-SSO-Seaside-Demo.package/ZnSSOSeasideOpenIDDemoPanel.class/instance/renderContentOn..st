rendering
renderContentOn: html

	html heading
		level: 2;
		with: 'OpenID2 Authentication Response'.
		
	self authResponse isNil
		ifTrue: [ 
			html text: 'No response received.'.
			^ self ].

	self 	renderField: 'openid.mode' value: self authResponse mode on: html.
	self authResponse isSuccess 
		ifFalse: [ ^ self  ].

	self
		renderField: 'openid.identity' value: self authResponse identity on: html;
		renderField: 'openid.claimed_id' value: self authResponse claimedId on: html;
		renderField: 'First Name' value: self authResponse axValueFirstname on: html;
		renderField: 'Last name' value: self authResponse axValueLastname on: html;
		renderField: 'Email' value: self authResponse axValueEmail on: html;
		renderField: 'Country' value: self authResponse axValueCountry on: html;
		renderField: 'Language' value: self authResponse axValueLanguage on: html
