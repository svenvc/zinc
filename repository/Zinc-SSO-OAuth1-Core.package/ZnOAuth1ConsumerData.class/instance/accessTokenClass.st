accessing
accessTokenClass
	^ accessTokenClass ifNil: [ accessTokenClass := ZnOAuth1Token ]