convenience
sessionForGoogleAppsDomain: aString
	"Answer a OpenIDService object for the Google Apps domain."

	| provider |
	
	provider := self providers
		detect: [ :each | each isGoogleAppsProvider and: [ each domain = aString ] ]
		ifNone: [
			self providers add: ((ZnGoogleAppsOpenIDProvider forDomain: aString)
				name: self class providerNameGoogle;
				imgUrl: 'http://openid.net/images/get-logos/google.png';
				altText: 'Login with your Google Apps account';
				yourself ) ].
	^self sessionForProvider: provider