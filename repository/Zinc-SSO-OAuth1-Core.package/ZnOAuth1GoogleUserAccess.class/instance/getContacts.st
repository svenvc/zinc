api
getContacts

	| url result |
	
	url := ZnUrl fromString: 'https://www.google.com/m8/feeds/contacts/default/full'.
	result := self oauth1Service httpGet: url using: self accessToken.
	
	^result asString