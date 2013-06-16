convenience
myOpenIDProvider

	^self providers detect: [ :each | each name = self class providerNameMyOpenID ]