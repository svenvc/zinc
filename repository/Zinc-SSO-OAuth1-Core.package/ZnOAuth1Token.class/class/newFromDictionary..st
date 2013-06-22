instance creation
newFromDictionary: aDictionary

	^self new
		value: (aDictionary at: 'oauth_token');
		secret: (aDictionary at: 'oauth_token_secret');
		yourself
