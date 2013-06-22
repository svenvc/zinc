instance creation
newFromDictionary: aDictionary

	^(super newFromDictionary:  aDictionary)
		userId: (aDictionary at: 'user_id') ;
		screenName: (aDictionary at: 'screen_name') ;
		yourself
