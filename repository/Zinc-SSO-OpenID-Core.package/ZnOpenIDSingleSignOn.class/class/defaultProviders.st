resources
defaultProviders

	^ OrderedCollection new
		add: ZnOpenIDProvider newGoogleProvider ;
		add: ZnOpenIDProvider newMyOpenIDProvider ;
		add: ZnOpenIDProvider newYahooProvider ;
		add: ZnOpenIDProvider newHyvesProvider ;
		yourself