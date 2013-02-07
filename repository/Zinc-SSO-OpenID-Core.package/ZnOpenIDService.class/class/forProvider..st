instance creation
forProvider: anOpenIDProvider

	^self new
		provider: anOpenIDProvider;
		setEndpoint: anOpenIDProvider discoverEndpoint ;
		yourself